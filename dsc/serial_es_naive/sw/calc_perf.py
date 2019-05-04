#!/usr/bin/python


def ev_perf_naive(inputs,bits):
    acc = 0.0
    bin_list = []
    bin_list.append(1)
    prob = 1.0/(2**bits)
    for bin in range(1,2**bits):
        bin_list.append(bin*(2**((inputs-1)*bits)))
        #acc += 1.0*bin*(2**((inputs-1)*bits))
    #print bin_list
    #print sum(bin_list)/prob
    #print prob
    return sum(bin_list)*prob

def ev_perf_imp(inputs,bits):
    acc = 0.0
    prob_list = []
    for i in range(1,(2**(bits)+1)):
        num_entries_in_bin = (i)**(inputs) - (i-1)**(inputs)
        #print num_entries
        prob_of_bin = num_entries_in_bin/(0.0 + (2**bits)**inputs)
        prob_list.append(prob_of_bin)
    #print prob_list
    #print sum(prob_list)
    bin_list = []
    bin_list.append(1)
    for bin in range(1,(2**bits)):
        bin_list.append(bin*(2**((inputs-1)*bits)))
    #print bin_list
    bin_list.reverse()
    #print bin_list
    for i in range(len(bin_list)):
        #print bin_list[i],prob_list[i]
        acc += bin_list[i]*prob_list[i]
    return acc

def main():
    print "alex"
    ev_perf_naive(2,4)
    ev_perf_naive(2,2)
    #xxx
    for i in range(2,5):
        for j in range(4,11,2):
            val = ev_perf_naive(i,j)
            print "es_naive (i=%d,n=%d) : %f" % (i,j,val)
    #ev_perf_imp(2,4)
    for i in range(2,5):
        for j in range(4,11,2):
            val = ev_perf_imp(i,j)
            print "es_imp (i=%d,n=%d) : %f" % (i,j,val)

if __name__ == "__main__": main()
