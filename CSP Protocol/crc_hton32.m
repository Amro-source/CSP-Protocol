% % % /* Convert 32-bit number from host byte order to network byte order */
% % % inline uint32_t __attribute__ ((__const__)) csp_hton32(uint32_t h32) {
% % % #ifdef CSP_BIG_ENDIAN
% % % 	return h32;
% % % #else
% % % 	return (((h32 & 0xff000000) >> 24) |
% % % 			((h32 & 0x000000ff) << 24) |
% % % 			((h32 & 0x0000ff00) <<  8) |
% % % 			((h32 & 0x00ff0000) >>  8));
% % % #endif
% % % }