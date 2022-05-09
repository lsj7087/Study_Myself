import sys

T = int(input())
if 1 <= T <= 1000000:
    for i in range(T):
        A, B = map(int,sys.stdin.readline().split())
        if 1<=A<=1000 and 1<=B<=1000:
            print(A+B)
