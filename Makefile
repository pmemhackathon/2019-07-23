#
# Makefile for simplekv example
#

PROGS = warmup find_bugs queue queue_pmemobj_cpp simplekv_simple simplekv_word_count memkind
CXXFLAGS = -g -std=c++11 -DLIBPMEMOBJ_CPP_VG_PMEMCHECK_ENABLED=1 `pkg-config --cflags valgrind`
PMEMOBJLIBS = -lpmemobj
MEMKINDLIBS = -lmemkind

all: $(PROGS)

warmup: warmup.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

simplekv_simple: simplekv_simple.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

simplekv_word_count: simplekv_word_count.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

find_bugs: find_bugs.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

queue: queue.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

queue_pmemobj: queue_pmemobj.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

queue_pmemobj_cpp: queue_pmemobj_cpp.o
	$(CXX) -o $@ $(CXXFLAGS) $^ $(PMEMOBJLIBS)

memkind: memkind.o
	$(CC) -o $@ $^ $(MEMKINDLIBS)

clean:
	$(RM) *.o $(PROGS)

clobber: clean
	$(RM) $(PROGS)

.PHONY: all clean clobber
