#include <stdio.h>
#include <stdint.h>
#include <pthread.h>
#include <bds_types.h>
#include <bds_sys.h>
#include <bds_slab.h>
int ctor = 1;
int main(void)
{
	bds_cache_desc_t cache_p;

	bds_cache_create("test", 10, 0, NULL, NULL, &cache_p);

	bds_cache_chain_dump();
	bds_cache_desc_dump(cache_p);

	return 0;
}
