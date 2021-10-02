function id = constructidlittleendian()
CSP_ID_PRIO_SIZE=2;
CSP_ID_HOST_SIZE=5;
CSP_ID_PORT_SIZE=6;
CSP_ID_FLAGS_SIZE=8;

CSP_ID_PRIO = dec2bin(0,CSP_ID_PRIO_SIZE);
CSP_ID_src = dec2bin(0,CSP_ID_HOST_SIZE);

CSP_ID_dst = dec2bin(0,CSP_ID_HOST_SIZE);
CSP_ID_dport= dec2bin(0,CSP_ID_PORT_SIZE);

CSP_ID_sport= dec2bin(0,CSP_ID_PORT_SIZE);

CSP_ID_flags= dec2bin(0,CSP_ID_FLAGS_SIZE);


% id=[CSP_ID_PRIO CSP_ID_src CSP_ID_dst CSP_ID_dport CSP_ID_sport CSP_ID_flags];

id=[CSP_ID_PRIO ];


end