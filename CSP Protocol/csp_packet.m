
clc; clear all; close all;
global Gear;
global csp_reserved_ports;
global priorities;

Gear = enum3('Reverse','Neutral','Low','Med','High');

csp_reserved_ports=enum3('CMP','PING','PS','MEMFREE','REBOOT','BUF_FREE','UPTIME','ANY','PROMISC');


priorities=enum3('PRIO_CRITICAL','PRIO_HIGH','PRIO_NORM','PRIO_LOW');

% %  #define CSP_MAX_BIND_PORT 15


ratio = calc_gear_ratio2(Gear.Reverse)

port1 = calcportvalues(csp_reserved_ports.CMP)
port2 = calcportvalues(csp_reserved_ports.PING)
port3 = calcportvalues(csp_reserved_ports.PS)
port4 = calcportvalues(csp_reserved_ports.MEMFREE)
port5 = calcportvalues(csp_reserved_ports.REBOOT)
port6 = calcportvalues(csp_reserved_ports.BUF_FREE)
port7 = calcportvalues(csp_reserved_ports.UPTIME)
port8 = calcportvalues(csp_reserved_ports.ANY)
port8 = calcportvalues(csp_reserved_ports.PROMISC)


prior1 = calcpriorities(priorities.PRIO_CRITICAL);

% % enum csp_reserved_ports_e {
% % % 	CSP_CMP				= 0,
% % % 	CSP_PING			= 1,
% % % 	CSP_PS			  	= 2,
% % % 	CSP_MEMFREE		 	= 3,
% % % 	CSP_REBOOT		  	= 4,
% % % 	CSP_BUF_FREE		= 5,
% % % 	CSP_UPTIME			= 6,
% % % 	CSP_ANY			 	= (CSP_MAX_BIND_PORT + 1),
% % % 	CSP_PROMISC		 	= (CSP_MAX_BIND_PORT + 2)
% % % };




% % % typedef enum {
% % % 	CSP_PRIO_CRITICAL	= 0,
% % % 	CSP_PRIO_HIGH		= 1,
% % % 	CSP_PRIO_NORM 		= 2,
% % % 	CSP_PRIO_LOW		= 3,
% % % } csp_prio_t;



% /** Size of bit-fields in CSP header */
% #define CSP_ID_PRIO_SIZE		2
% #define CSP_ID_HOST_SIZE		5
% #define CSP_ID_PORT_SIZE		6
% #define CSP_ID_FLAGS_SIZE		8


CSP_ID_PRIO_SIZE=2;
CSP_ID_HOST_SIZE=5;
CSP_ID_PORT_SIZE=6;
CSP_ID_FLAGS_SIZE=8;

% CSP_PRIORITIES			(1 << CSP_ID_PRIO_SIZE)


 CSP_PRIORITIES = bitshift(CSP_ID_PRIO_SIZE,1); %%%%Shift to the left one bit
 
 CSP_HEADER_BITS	=		(CSP_ID_PRIO_SIZE + 2 * CSP_ID_HOST_SIZE + 2 * CSP_ID_PORT_SIZE + CSP_ID_FLAGS_SIZE);
 
 
 
 CSP_HEADER_LENGTH	=	(CSP_HEADER_BITS/8);
 
 
% #define CSP_ID_PRIO_MAX			((1 << (CSP_ID_PRIO_SIZE)) - 1)
% #define CSP_ID_HOST_MAX			((1 << (CSP_ID_HOST_SIZE)) - 1)
% #define CSP_ID_PORT_MAX			((1 << (CSP_ID_PORT_SIZE)) - 1)
% #define CSP_ID_FLAGS_MAX		((1 << (CSP_ID_FLAGS_SIZE)) - 1)
% 

% % % /** Highest number to be entered in field */


CSP_ID_PRIO_MAX		=	bitshift(CSP_ID_PRIO_SIZE,1)-1;
CSP_ID_HOST_MAX		=	bitshift(CSP_ID_HOST_SIZE,1)-1;
 CSP_ID_PORT_MAX	=	bitshift(CSP_ID_PORT_SIZE,1)-1;		
CSP_ID_FLAGS_MAX	=	bitshift(CSP_ID_FLAGS_SIZE,1)-1;		


% #define CSP_BROADCAST_ADDR	CSP_ID_HOST_MAX
% 
% /** Default routing address */
% #define CSP_DEFAULT_ROUTE	(CSP_ID_HOST_MAX + 1)

CSP_BROADCAST_ADDR=	CSP_ID_HOST_MAX;
CSP_DEFAULT_ROUTE	=(CSP_ID_HOST_MAX + 1);


% % #define CSP_RX_QUEUE_LENGTH		(CSP_CONN_QUEUE_LENGTH / CSP_PRIORITIES)
% % #define CSP_ROUTE_FIFOS			CSP_PRIORITIES
% % #define CSP_RX_QUEUES			CSP_PRIORITIES
% % #else
% % #define CSP_RX_QUEUE_LENGTH 	CSP_CONN_QUEUE_LENGTH
% % #define CSP_ROUTE_FIFOS			1
% % #define CSP_RX_QUEUES			1

CSP_CONN_QUEUE_LENGTH=500;

CSP_RX_QUEUE_LENGTH	=	(CSP_CONN_QUEUE_LENGTH / CSP_PRIORITIES);

CSP_ROUTE_FIFOS		=	CSP_PRIORITIES;

CSP_RX_QUEUES		=	CSP_PRIORITIES;

CSP_RX_QUEUE_LENGTH =	CSP_CONN_QUEUE_LENGTH;


 CSP_ROUTE_FIFOS	=		1;
 
 CSP_RX_QUEUES		=	1;
 
% % %  #define CSP_PADDING_BYTES 8


CSP_PADDING_BYTES =8;

% % % /** Identifier field masks */
% % % #define CSP_ID_PRIO_MASK		((uint32_t) CSP_ID_PRIO_MAX 	<< (CSP_ID_FLAGS_SIZE + 2 * CSP_ID_PORT_SIZE + 2 * CSP_ID_HOST_SIZE))
% % % #define CSP_ID_SRC_MASK	 		((uint32_t) CSP_ID_HOST_MAX 	<< (CSP_ID_FLAGS_SIZE + 2 * CSP_ID_PORT_SIZE + 1 * CSP_ID_HOST_SIZE))
% % % #define CSP_ID_DST_MASK	 		((uint32_t) CSP_ID_HOST_MAX 	<< (CSP_ID_FLAGS_SIZE + 2 * CSP_ID_PORT_SIZE))
% % % #define CSP_ID_DPORT_MASK   	((uint32_t) CSP_ID_PORT_MAX 	<< (CSP_ID_FLAGS_SIZE + 1 * CSP_ID_PORT_SIZE))
% % % #define CSP_ID_SPORT_MASK   	((uint32_t) CSP_ID_PORT_MAX 	<< (CSP_ID_FLAGS_SIZE))
% % % #define CSP_ID_FLAGS_MASK		((uint32_t) CSP_ID_FLAGS_MAX 	<< (0))
% % % 
% % % #define CSP_ID_CONN_MASK		(CSP_ID_SRC_MASK | CSP_ID_DST_MASK | CSP_ID_DPORT_MASK | CSP_ID_SPORT_MASK)


 CSP_ID_PRIO_MASK	=	bitshift(CSP_ID_PRIO_MAX,CSP_ID_FLAGS_SIZE + 2 * CSP_ID_PORT_SIZE + 2 * CSP_ID_HOST_SIZE);



% % % typedef union {
% % % 	uint32_t ext;
% % % 	struct __attribute__((__packed__)) {
% % % #if defined(CSP_BIG_ENDIAN) && !defined(CSP_LITTLE_ENDIAN)
% % % 		unsigned int pri : CSP_ID_PRIO_SIZE;
% % % 		unsigned int src : CSP_ID_HOST_SIZE;
% % % 		unsigned int dst : CSP_ID_HOST_SIZE;
% % % 		unsigned int dport : CSP_ID_PORT_SIZE;
% % % 		unsigned int sport : CSP_ID_PORT_SIZE;
% % % 		unsigned int flags : CSP_ID_FLAGS_SIZE;
% % % #elif defined(CSP_LITTLE_ENDIAN) && !defined(CSP_BIG_ENDIAN)
% % % 		unsigned int flags : CSP_ID_FLAGS_SIZE;
% % % 		unsigned int sport : CSP_ID_PORT_SIZE;
% % % 		unsigned int dport : CSP_ID_PORT_SIZE;
% % % 		unsigned int dst : CSP_ID_HOST_SIZE;
% % % 		unsigned int src : CSP_ID_HOST_SIZE;
% % % 		unsigned int pri : CSP_ID_PRIO_SIZE;


csp_endian=1;  %%%%big endian
% csp_endian=0;  %%%%little endian


% str = dec2bin(d,n)

% % % #else
% % % 		#error "Must define one of CSP_BIG_ENDIAN or CSP_LITTLE_ENDIAN in csp_platform.h"
% % % #endif
% % % 	};
% % % } csp_id_t;



