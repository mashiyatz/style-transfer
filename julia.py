import tensorflow as tf
import numpy as np
from PIL import Image
import argparse

parser = argparse.ArgumentParser(description='Julia with TensorFlow.')
parser.add_argument("--start_x", type=float, default=-1.9)
parser.add_argument("--end_x", type=float, default=1.9)
parser.add_argument("--start_y", type=float, default=-1.1)
parser.add_argument("--end_y", type=float, default=1.1)

parser.add_argument("--c", type=str) #default='-0.835-0.2321')
parser.add_argument("--bg_ratio", nargs='+', type=float) #, default=4. 2.5 1.)
parser.add_argument("--ratio", nargs='+', type=float) #, default=0.9 0.9 0.9)

parser.add_argument("--width", type=int, default=1000)
parser.add_argument("--output", type=str, default='share/julia.png')


args = parser.parse_args()


R = 4
ITER_NUM = 200


def get_color(bg_ratio, ratio):
    def color(z, i):
        if abs(z) < R:
            return 0, 0, 0
        v = np.log2(i + R - np.log2(np.log2(abs(z)))) / 5
        if v < 1.0:
            return v**bg_ratio[0], v**bg_ratio[1], v ** bg_ratio[2]
        else:
            v = max(0, 2 - v)
            return v**ratio[0], v**ratio[1], v**ratio[2]
    return color


def gen_julia(Z, c, bg_ratio, ratio):
    xs = tf.constant(np.full(shape=Z.shape, fill_value=c, dtype=Z.dtype))
    zs = tf.Variable(Z)
    ns = tf.Variable(tf.zeros_like(xs, tf.float32))
    with tf.Session():
        tf.global_variables_initializer().run()
        zs_ = tf.where(tf.abs(zs) < R, zs**2 + xs, zs)
        not_diverged = tf.abs(zs_) < R
        step = tf.group(
            zs.assign(zs_),
            ns.assign_add(tf.cast(not_diverged, tf.float32))
        )

        for i in range(ITER_NUM):
            step.run()
        final_step = ns.eval()
        final_z = zs_.eval()
    r, g, b = np.frompyfunc(get_color(bg_ratio, ratio), 2, 3)(final_z, final_step)
    img_array = np.dstack((r, g, b))
    return Image.fromarray(np.uint8(img_array * 255))


if __name__ == '__main__':
    start_x = args.start_x  # x range
    end_x = args.end_x
    start_y = args.start_y  # y range
    end_y = args.end_y
    width = args.width  # image width
    
    c = complex(args.c)
    bg_ratio = tuple(args.bg_ratio)
    ratio = tuple(args.ratio)

    step = (end_x - start_x) / width
    Y, X = np.mgrid[start_y:end_y:step, start_x:end_x:step]
    Z = X + 1j * Y

    img = gen_julia(Z, c, bg_ratio, ratio)
    img.save(args.output)
