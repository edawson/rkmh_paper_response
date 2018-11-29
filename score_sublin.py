import sys
from collections import defaultdict

if __name__ == "__main__":

    correct_d = defaultdict(int)
    wrong_d = defaultdict(int)
    uncl_d = defaultdict(int)
    n_correct = 0
    n_incorrect = 0
    n_unclassified = 0

    sublins = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

    with open(sys.argv[1], "r") as ifi:
        for line in ifi:
            line = line.strip()
            tokens = line.split()
            assigned_ref = tokens[0].split("_")[0]
            real = tokens[1].split("_")[0]
            unclassified = "FAIL" in line or (int(tokens[2]) == 0)
            if unclassified:
                n_unclassified += 1
                uncl_d[real] += 1
            elif assigned_ref == real:
                n_correct += 1
                correct_d[real] += 1
            else:
                n_incorrect += 1
                wrong_d[real] += 1
    #print("Correct:", n_correct, "Incorrect:", n_incorrect, "Unclassified:", n_unclassified)
    
    print ("#Sublineage\tCorrect\tIncorrect\tUnclassified")
    for i in sublins:
        cor = None 
        incor = None
        uncl = None 
        if i in correct_d:
            cor = correct_d[i]
        else:
            cor = 0
        
        if i in uncl_d:
            uncl = uncl_d[i]
        else:
            uncl = 0
        if i in wrong_d:
            incor = wrong_d[i]
        else:
            incor = 0
        total = uncl + cor + incor

        pct = lambda x, y : float(x) / float(y)
        
        cor = pct(cor, total)
        incor = pct(incor, total)
        uncl = pct(uncl, total)

        print("\t".join([str(x) for x in [i, '{0:.10f}'.format(cor), '{0:.10f}'.format(incor), '{0:.10f}'.format(uncl)]])) 
