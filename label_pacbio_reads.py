import sys

if __name__ == "__main__":

    with open(sys.argv[1], "r") as ifi:
        for line in ifi:
            line = line.strip()
            line = line.replace("Read", sys.argv[1].split("/")[-1][0:2])
            print(line)
