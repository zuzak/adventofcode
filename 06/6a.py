#! /usr/bin/env python
# -*- coding: utf-8 -*-
import sys


def main():
    grid = constructGrid(1000)

    data = open(sys.path[0] + '/input.txt').read()
    data = data.split("\n")

    for datum in data:
        if not datum:
            continue
        # TIL tuples
        cmd, a, c, b = datum.rsplit(' ', 3)
        func = getCommand(cmd)

        a = a.split(',')
        b = b.split(',')
        a = map(int, a)
        b = map(int, b)

        for x in range(a[0], b[0]+1):
            for y in range(a[1], b[1]+1):
                grid[x][y] = func(grid[x][y])

    count = 0
    for i in grid:
        count += sum(map(sum, zip(i)))
    print(count)


def constructGrid(count):
    o = []
    for i in range(count):
        o.append([])
        for j in range(count):
            o[i].append(0)
    return o


def getCommand(s):
    # get strs
    if 'on' in s:
        return lambda foo: 1
    elif 'off' in s:
        return lambda foo: 0
    elif 'toggle' in s:
        return lambda foo: 1 - foo
    else:
        return False

if __name__ == "__main__":
    main()
