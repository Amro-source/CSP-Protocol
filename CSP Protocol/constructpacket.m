

function packet=constructpacket()


id = constructidbigendiandec(3,3,3,3,3,3)

% id=reshape(id,[],8);
% 
% q=bi2de(uint8(id));


sizeInBytes=1024;

 data=Randomizedata(sizeInBytes)


 packet=[id data];

[result] = crc32(data);


result=reshape(result,[],8);

result=bi2de(result)


packet=[packet result'];




end





% % typedef struct __attribute__((__packed__)) {
% % 	uint8_t padding[CSP_PADDING_BYTES];	/**< Interface dependent padding */
% % 	uint16_t length;					/**< Length field must be just before CSP ID */
% % 	csp_id_t id;						/**< CSP id must be just before data */
% % 	union {
% % 		uint8_t data[0];				/**< This just points to the rest of the buffer, without a size indication. */
% % 		uint16_t data16[0];				/**< The data 16 and 32 types makes it easy to reference an integer (properly aligned) */
% % 		uint32_t data32[0];				/**< without the compiler warning about strict aliasing rules. */
% % 	};
% % } csp_packet_t;

