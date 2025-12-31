'From Cuis7.2 [latest update: #6897] on 30 December 2025 at 1:19:04 pm'!
'Description '!
!provides: 'IShell' 1 181!
!requires: 'FFI' 1 47 nil!
!requires: 'Tests-FFI' 1 6 nil!
!requires: 'CtuMem' 1 46 nil!
SystemOrganization addCategory: #IShell!


!classDefinition: #IShellError category: #IShell!
Error subclass: #IShellError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IShell'!
!classDefinition: 'IShellError class' category: #IShell!
IShellError class
	instanceVariableNames: ''!

!classDefinition: #PdipCfgT category: #IShell!
ExternalStructure subclass: #PdipCfgT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IShell'!
!classDefinition: 'PdipCfgT class' category: #IShell!
PdipCfgT class
	instanceVariableNames: ''!

!classDefinition: #Timeval category: #IShell!
ExternalStructure subclass: #Timeval
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IShell'!
!classDefinition: 'Timeval class' category: #IShell!
Timeval class
	instanceVariableNames: ''!

!classDefinition: #IShell category: #IShell!
Object subclass: #IShell
	instanceVariableNames: 'cfgt ctuMem pdip displayString displayDPtr displaySize dataSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IShell'!
!classDefinition: 'IShell class' category: #IShell!
IShell class
	instanceVariableNames: ''!

!classDefinition: #IShellTest category: #IShell!
TestCase subclass: #IShellTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IShell'!
!classDefinition: 'IShellTest class' category: #IShell!
IShellTest class
	instanceVariableNames: ''!


!IShell commentStamp: '<historical>' prior: 0!
This class requires the pdip C library. Tested on pdip 2.4.7!

!PdipCfgT methodsFor: 'accessing'!
buf_resize_increment
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	^handle uint64At: 33! !

!PdipCfgT methodsFor: 'accessing'!
buf_resize_increment: anObject
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	handle uint64At: 33 put: anObject! !

!PdipCfgT methodsFor: 'accessing'!
cpu
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	^ExternalData fromHandle: (handle pointerAt: 25) type: ExternalType char asPointerType! !

!PdipCfgT methodsFor: 'accessing'!
cpu: anObject
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	handle pointerAt: 25 put: anObject getHandle! !

!PdipCfgT methodsFor: 'accessing'!
dbg_output
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	^ExternalData fromHandle: (handle pointerAt: 1) type: ExternalType void asPointerType! !

!PdipCfgT methodsFor: 'accessing'!
dbg_output: anObject
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	handle pointerAt: 1 put: anObject getHandle! !

!PdipCfgT methodsFor: 'accessing'!
debug_level
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	^handle int32At: 17! !

!PdipCfgT methodsFor: 'accessing'!
debug_level: anObject
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	handle int32At: 17 put: anObject! !

!PdipCfgT methodsFor: 'accessing'!
err_output
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	^ExternalData fromHandle: (handle pointerAt: 9) type: ExternalType void asPointerType! !

!PdipCfgT methodsFor: 'accessing'!
err_output: anObject
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	handle pointerAt: 9 put: anObject getHandle! !

!PdipCfgT methodsFor: 'accessing'!
flags
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	^handle uint32At: 21! !

!PdipCfgT methodsFor: 'accessing'!
flags: anObject
	"This method was automatically generated. See PdipCfgT class>>fields."
	<generated>
	handle uint32At: 21 put: anObject! !

!PdipCfgT class methodsFor: 'constants' stamp: 'ct 4/22/2025 09:50:06'!
PDIP_FLAG_ERR_REDIRECT
	^16r01! !

!PdipCfgT class methodsFor: 'constants' stamp: 'ct 4/22/2025 09:50:24'!
PDIP_FLAG_RECV_ON_THE_FLOW
	^16r02! !

!PdipCfgT class methodsFor: 'field definition' stamp: 'ct 12/25/2025 12:42:30'!
fields
	" Use this (once) to create the accessors: PdipCfgT defineFields.) "
 ^#( 
	(dbg_output 'FILE *') 
	(err_output 'FILE *') 
	(debug_level 'int32')
	(flags 'uint32')
	(cpu 'char *')
	(buf_resize_increment 'size_t')
	)! !

!PdipCfgT class methodsFor: 'class initialization' stamp: 'ct 4/20/2025 21:08:57'!
initialize
	self compileFields.! !

!Timeval methodsFor: 'converting' stamp: 'ct 12/28/2025 16:31:51'!
toString
	^(self className, ': (tv_sec=', (self tv_sec asString), ', tv_usec=', (self tv_usec asString) , ')')! !

!Timeval methodsFor: 'comparing' stamp: 'ct 12/28/2025 16:35:19'!
= aTimeval
	^aTimeval class == self class
		and: [aTimeval tv_sec  = self tv_sec
		   and: [aTimeval tv_usec = self tv_usec]].
	! !

!Timeval methodsFor: 'comparing' stamp: 'ct 12/28/2025 16:54:32'!
hash
	^{self tv_sec. self tv_usec} hash.! !

!Timeval methodsFor: 'printing' stamp: 'ct 12/28/2025 17:04:43'!
printOn: aStream
	aStream nextPutAll: (self toString).! !

!Timeval methodsFor: 'accessing'!
tv_sec
	"This method was automatically generated. See Timeval class>>fields."
	<generated>
	^handle uint64At: 1! !

!Timeval methodsFor: 'accessing'!
tv_sec: anObject
	"This method was automatically generated. See Timeval class>>fields."
	<generated>
	handle uint64At: 1 put: anObject! !

!Timeval methodsFor: 'accessing'!
tv_usec
	"This method was automatically generated. See Timeval class>>fields."
	<generated>
	^handle uint64At: 9! !

!Timeval methodsFor: 'accessing'!
tv_usec: anObject
	"This method was automatically generated. See Timeval class>>fields."
	<generated>
	handle uint64At: 9 put: anObject! !

!Timeval class methodsFor: 'class initialization' stamp: 'ct 12/20/2025 23:55:01'!
initialize
	self compileFields.! !

!Timeval class methodsFor: 'field definition' stamp: 'ct 12/21/2025 00:13:29'!
fields
	" Use this (once) to create the accessors: Timeval defineFields.) "
 ^#( 
	(tv_sec 'uint64') 
	(tv_usec 'uint64') 
	)! !

!IShell methodsFor: 'initialization' stamp: 'ct 12/30/2025 10:49:55'!
initialize
	" with default configuration "
	| rc |
	
	cfgt := PdipCfgT new.
	rc := self pdip_cfg_init: (cfgt getHandle).

	(rc = 0) ifFalse: [
		^IShellError error: 'Couldn''t init pdif with the default configuration'.	
	].

	self pdip_configure: 1 debugLevel: 0.
	pdip := self pdip_new: (cfgt getHandle).

	(pdip isNil) ifTrue: [
		^IShellError error: 'pdip_new call failed'.
	].

	self initPointers.
! !

!IShell methodsFor: 'private - initialize' stamp: 'ct 12/30/2025 10:22:57'!
initCtuMem: commands
	" execute a command which should be a string Array, nil is not needed at the end (it will be attached) "
	ctuMem := CtuMem initWith: (commands size + 1).
	commands do: [:elem | 
		ctuMem add: elem.
	].
	ctuMem add: nil.! !

!IShell methodsFor: 'private - initialize' stamp: 'ct 12/30/2025 10:49:34'!
initPointers

	displayString := ExternalAddress gcallocate: ((IShell DEFAULT_BUFFER_SIZE) * 64).
	displayDPtr := ExternalAddress gcallocate: 64.
	displayDPtr pointerAt: 1 put: displayString.
	
	displaySize  := ExternalAddress gcallocate: 64.
	displaySize longPointerAt: 1 put: (IShell DEFAULT_BUFFER_SIZE).

	dataSize := ExternalAddress gcallocate: 64.
	dataSize longPointerAt: 1 put: 0.
! !

!IShell methodsFor: 'exec:' stamp: 'ct 12/30/2025 10:42:31'!
delete
	| rc |
	
	displayString free.
	displayDPtr free.
	displaySize free.
	ctuMem free.
	
	rc := self pdip_delete: pdip status: nil.
	
	(rc = 0) ifFalse: [
		IShellError error: 'pdip_delete failed'.	
	].! !

!IShell methodsFor: 'exec:' stamp: 'ct 12/30/2025 11:14:25'!
receiveWithTimeout: seconds
	| rc output timeval |
	
	timeval := Timeval new tv_sec: seconds; tv_usec: 0; yourself.
	
	rc := self pdip_recv: pdip regex: nil display: displayDPtr displaySize: displaySize dataSize: dataSize timeout: (timeval getHandle).
	
	output := String new.
	1 to: ((dataSize longPointerAt: 1) asInteger) do: [ :x | 
		| incomingChar |
		incomingChar  := (Character codePoint: ((displayString pointerAt: x) at: 1)).
		
		" (incomingChar codePoint >= 32) ifTrue: [ "
			output := output, (incomingChar asString).
		" ]. "
	].

	^output.! !

!IShell methodsFor: 'exec:' stamp: 'ct 12/30/2025 11:19:19'!
send: aString
	| sentDataSize |
	
	sentDataSize := self pdip_send_formatted: pdip message: aString.
	
	^sentDataSize.! !

!IShell methodsFor: 'exec:' stamp: 'ct 12/30/2025 13:19:00'!
send: aString andWait: seconds
	| sentDataSize |
	sentDataSize := self send: aString.
	
	(Delay forSeconds: seconds) wait.
	
	^sentDataSize.! !

!IShell methodsFor: 'exec:' stamp: 'ct 12/30/2025 11:20:29'!
sendWithLf: aString
	^self send: (aString, (Character lf asString)).! !

!IShell methodsFor: 'exec:' stamp: 'ct 12/30/2025 11:25:10'!
sendWithLf: aString andWait: seconds
	| sentDataSize |
	sentDataSize := self send: (aString, (Character lf asString)).
	
	(Delay forSeconds: seconds) wait.
	
	^sentDataSize.! !

!IShell methodsFor: 'initialize' stamp: 'ct 12/30/2025 10:18:40'!
exec: commands
	" execute a command which should be a string Array, nil is not needed at the end (it will be attached) "
	| rc |
	
	self initCtuMem: commands.
	rc := self pdip_exec: pdip ac: (ctuMem getSizeWithoutLast) av: (ctuMem getArray).
	
	(rc = -1) ifTrue: [
		^IShellError error: 'pdip_exec failed'.	
	].
! !

!IShell methodsFor: 'initialize' stamp: 'ct 12/30/2025 13:15:45'!
exec: commands andWait: seconds
	" execute a command which should be a string Array, nil is not needed at the end (it will be attached) "
	| rc |
	
	self initCtuMem: commands.
	rc := self pdip_exec: pdip ac: (ctuMem getSizeWithoutLast) av: (ctuMem getArray).
	
	(rc = -1) ifTrue: [
		^IShellError error: 'pdip_exec failed'.	
	].

	(Delay forSeconds: seconds) wait.
	! !

!IShell methodsFor: 'pdip' stamp: 'ct 4/21/2025 11:20:10'!
pdip_cfg_init: cfg
	" int pdip_cfg_init(
                  pdip_cfg_t *cfg
		  );
	"
	<cdecl: int32  'pdip_cfg_init' (void *) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 4/21/2025 11:20:30'!
pdip_configure: sigHdlInternal debugLevel: debugLevel
	" int pdip_configure(
                    int sig_hdl_internal,
                    int debug_level
		    ); "
	<cdecl: int32  'pdip_configure' (int32 int32) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 4/21/2025 11:20:40'!
pdip_cpu_nb
	" int pdip_cpu_nb(void) "
	<cdecl: int32  'pdip_cpu_nb' (void) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 4/22/2025 10:34:33'!
pdip_delete: pdiptContext status: status
	" int pdip_delete(
                pdip_t  ctx,
                int    *status
		);
 "
	<cdecl: int32  'pdip_delete' (void* int32) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 4/22/2025 17:26:22'!
pdip_exec: pdiptContext ac: ac av: av
	" int pdip_exec(
                     pdip_t  ctx,
                     int     ac,
                     char   *av[]
	            ); 
	"
	<cdecl: int32  'pdip_exec' (void* int32 void*) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 4/22/2025 14:59:20'!
pdip_new: config
	" pdip_t pdip_new(
                        pdip_cfg_t *cfg
                      );
 "
	<cdecl: void*  'pdip_new' (void *) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 12/28/2025 16:14:44'!
pdip_recv: pdiptContext regex: aString display: aDisplay displaySize: aDisplaySizeRef dataSize: aDataSizeRef timeout: aTimeval
"
  int pdip_recv(
              pdip_t          *ctx,
	      const char      *regular_expr,
              char           **display,
              size_t          *display_sz,
              size_t          *data_sz,      // OUT: strlen() of the received data (i.e. Terminating NUL not counted)
              struct timeval  *timeout
             )
"
	<cdecl: int32  'pdip_recv' (void* char* void* long* long* void*) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell methodsFor: 'pdip' stamp: 'ct 12/29/2025 14:54:48'!
pdip_send_formatted: pdiptContext message: aString
"
extern int pdip_send_formatted(
      pdip_t ctx,
      const char *formatted_str   
                       );
"
	<cdecl: int32  'pdip_send_formatted' (void* char*) module: 'libpdip'>
	^ self externalCallFailed.! !

!IShell class methodsFor: 'constants' stamp: 'ct 12/30/2025 10:48:29'!
DEFAULT_BUFFER_SIZE
	^200000.! !

!IShell class methodsFor: 'constants' stamp: 'ct 12/21/2025 17:56:46'!
PDIP_RECV_DATA
	^2! !

!IShell class methodsFor: 'constants' stamp: 'ct 12/21/2025 17:55:42'!
PDIP_RECV_ERROR
	^-1! !

!IShell class methodsFor: 'constants' stamp: 'ct 12/21/2025 17:55:56'!
PDIP_RECV_FOUND
	^0! !

!IShell class methodsFor: 'constants' stamp: 'ct 12/21/2025 17:56:36'!
PDIP_RECV_TIMEOUT
	^1! !

!IShell class methodsFor: 'constants' stamp: 'ct 4/22/2025 09:48:56'!
PDIP_SIG_ERROR
	^2! !

!IShell class methodsFor: 'constants' stamp: 'ct 4/22/2025 09:48:21'!
PDIP_SIG_HANDLED
	^0! !

!IShell class methodsFor: 'constants' stamp: 'ct 4/22/2025 09:48:36'!
PDIP_SIG_UNKNOWN
	^1! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/26/2025 09:42:37'!
test_pdip_cfg_init
	| cfgt rc |
		
	cfgt := PdipCfgT new.
	rc := IShell new pdip_cfg_init: (cfgt getHandle).
"	Transcript show: (cfgt cpu asString); cr. "
"	Transcript show: (cfgt cpu fromCString); cr. "
"	Transcript show: (cfgt flags asString); cr. "
	
	self assert: rc equals: 0.! !

!IShellTest methodsFor: 'cases' stamp: 'ct 4/21/2025 10:48:32'!
test_pdip_configure
	| rc |
	
	rc := IShell new pdip_configure: 1 debugLevel: 0.
	
	self assert: rc equals: 0.	! !

!IShellTest methodsFor: 'cases' stamp: 'ct 4/21/2025 10:51:17'!
test_pdip_cpu_nb
	| cpus |
	
	cpus := IShell new pdip_cpu_nb.
	
	self assert: (cpus > 0) equals: true.! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/28/2025 16:18:14'!
test_pdip_exec
	| cfgt pdipt rc ish cmem |
	
	cfgt := PdipCfgT new.
	ish := IShell new.
	
	rc := ish pdip_cfg_init: (cfgt getHandle).
	self assert: rc equals: 0.

	pdipt := ish pdip_new: (cfgt getHandle). " the param can be 0 as well "
	self assert: pdipt notNil.   " pdipt is ExternalData "

	cmem := CtuMem initWith: 3.
	cmem add: 'ls'; add: '-la'; add: nil.

	rc := ish pdip_exec: pdipt ac: (cmem getSizeWithoutLast) av: (cmem getArray).
	self assert: (rc = -1) equals: false.
	
	cmem free.
	rc := ish pdip_delete: pdipt status: nil.
	self assert: rc equals: 0.! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/28/2025 16:18:49'!
test_pdip_new_delete
	| cfgt pdipt rc ish |
	
	cfgt := PdipCfgT new.
	ish := IShell new.
	
	rc := ish pdip_cfg_init: (cfgt getHandle).
	self assert: rc equals: 0.

	pdipt := ish pdip_new: (cfgt getHandle). " the param can be 0 as well "
	self assert: pdipt notNil.
	
	rc := ish pdip_delete: pdipt status: nil.
	self assert: rc equals: 0.	! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/28/2025 13:57:09'!
test_pdip_recv_any_noregex_try
	| cfgt pdipt rc ish cmem 
	  display displayS displaysz datasz timeval 
	  output |
	
	cfgt := PdipCfgT new.
	ish := IShell new.
	
	rc := ish pdip_cfg_init: (cfgt getHandle).
	self assert: rc equals: 0.

	ish pdip_configure: 1 debugLevel: 0.
	
	"cfgt flags: PdipCfgT PDIP_FLAG_RECV_ON_THE_FLOW. "
	pdipt := ish pdip_new: (cfgt getHandle). " the param can be 0 as well "
	self assert: pdipt notNil.   " pdipt is ExternalData "

	cmem := CtuMem initWith: 3.
	cmem add: '/usr/bin/echo'; add: '"Hello world"'; add: nil.

	rc := ish pdip_exec: pdipt ac: (cmem getSizeWithoutLast) av: (cmem getArray).
	self assert: (rc = -1) equals: false.

	displayS := ExternalAddress gcallocate: (200 * 64).
	display := ExternalAddress gcallocate: 64.
	display pointerAt: 1 put: displayS.
	
	displaysz  := ExternalAddress gcallocate: 64.
	displaysz longPointerAt: 1 put: 200.

	datasz := ExternalAddress gcallocate: 64.
	datasz longPointerAt: 1 put: 0.

	timeval := Timeval new.
	timeval tv_sec: 2.
	timeval tv_usec: 0.

	rc := ish pdip_recv: pdipt regex: nil display: display displaySize: displaysz dataSize: datasz timeout: (timeval getHandle).
	Transcript show: 'recv result: ', (rc asString); cr.
	Transcript show: 'data size:', ((datasz longPointerAt: 1) asInteger asString); cr.

	output := String new.
	1 to: ((datasz longPointerAt: 1) asInteger) do: [ :x | 
		output := output, ((Character codePoint: ((displayS pointerAt: x) at: 1)) asString).
	].
	
	self assert: rc equals: (IShell PDIP_RECV_DATA).
	self assert: (output beginsWith: '"Hello world"').

	displaysz free.
	datasz free.
	displayS free.
	cmem free.

	rc := ish pdip_delete: pdipt status: nil.
	self assert: rc equals: 0.! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/28/2025 18:44:03'!
test_pdip_recv_regex_timeout
	| cfgt pdipt rc ish cmem 
	  display displayS displaysz datasz timeval |
	
	cfgt := PdipCfgT new.
	ish := IShell new.
	
	rc := ish pdip_cfg_init: (cfgt getHandle).
	self assert: rc equals: 0.

	ish pdip_configure: 1 debugLevel: 0.
	
	"cfgt flags: PdipCfgT PDIP_FLAG_RECV_ON_THE_FLOW. "
	pdipt := ish pdip_new: (cfgt getHandle). " the param can be 0 as well "
	self assert: pdipt notNil.   " pdipt is ExternalData "

	cmem := CtuMem initWith: 3.
	cmem add: '/usr/bin/sleep'; add: '3'; add: nil.

	rc := ish pdip_exec: pdipt ac: (cmem getSizeWithoutLast) av: (cmem getArray).
	self assert: (rc = -1) equals: false.

	displayS := ExternalAddress gcallocate: (200 * 64).
	display := ExternalAddress gcallocate: 64.
	display pointerAt: 1 put: displayS.
	
	displaysz  := ExternalAddress gcallocate: 64.
	displaysz longPointerAt: 1 put: 200.

	datasz := ExternalAddress gcallocate: 64.
	datasz longPointerAt: 1 put: 0.

	timeval := Timeval new.
	timeval tv_sec: 2.
	timeval tv_usec: 0.

	rc := ish pdip_recv: pdipt regex: 'asdfg' display: display displaySize: displaysz dataSize: datasz timeout: (timeval getHandle).
	Transcript show: 'recv result: ', (rc asString); cr.
	Transcript show: 'data size:', ((datasz longPointerAt: 1) asInteger asString); cr.
	
	self assert: rc equals: (IShell PDIP_RECV_TIMEOUT).

	displaysz free.
	datasz free.
	displayS free.
	cmem free.

	rc := ish pdip_delete: pdipt status: nil.
	self assert: rc equals: 0.! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/30/2025 10:26:07'!
test_pdip_send_formatted
	| cfgt pdipt rc ish cmem 
	  display displayS displaysz datasz timeval 
	  output |
	
	cfgt := PdipCfgT new.
	ish := IShell new.
	
	rc := ish pdip_cfg_init: (cfgt getHandle).
	self assert: rc equals: 0.

	ish pdip_configure: 1 debugLevel: 0.
	
	"cfgt flags: PdipCfgT PDIP_FLAG_RECV_ON_THE_FLOW. "
	pdipt := ish pdip_new: (cfgt getHandle). " the param can be 0 as well "
	self assert: pdipt notNil.   " pdipt is ExternalData "

	cmem := CtuMem initWith: 2.
	cmem add: 'bc'; add: nil.

	rc := ish pdip_exec: pdipt ac: (cmem getSizeWithoutLast) av: (cmem getArray).
	self assert: (rc = -1) equals: false.

	displayS := ExternalAddress gcallocate: (200000 * 64).
	display := ExternalAddress gcallocate: 64.
	display pointerAt: 1 put: displayS.
	
	displaysz  := ExternalAddress gcallocate: 64.
	displaysz longPointerAt: 1 put: 200000.

	datasz := ExternalAddress gcallocate: 64.
	datasz longPointerAt: 1 put: 0.

	timeval := Timeval new.
	timeval tv_sec: 2.
	timeval tv_usec: 0.

	rc := ish pdip_recv: pdipt regex: nil display: display displaySize: displaysz dataSize: datasz timeout: (timeval getHandle).

	output := String new.
	1 to: ((datasz longPointerAt: 1) asInteger) do: [ :x | 
		output := output, ((Character codePoint: ((displayS pointerAt: x) at: 1)) asString).
	].
	Transcript show: 'First msg: ', output; cr.
	Transcript show: 'recv result: ', (rc asString); cr.
	Transcript show: 'data size:', ((datasz longPointerAt: 1) asInteger asString); cr.
	
	rc := ish pdip_send_formatted: pdipt message: ('48+12', (Character lf asString)).
	self assert: rc > 0.   "The amount of sent data"

	(Delay forSeconds: 2) wait.

	datasz longPointerAt: 1 put: 0.	
	rc := ish pdip_recv: pdipt regex: nil display: display displaySize: displaysz dataSize: datasz timeout: (timeval getHandle).

	output := String new.
	1 to: ((datasz longPointerAt: 1) asInteger) do: [ :x | 
		| incomingChar |
		incomingChar  := (Character codePoint: ((displayS pointerAt: x) at: 1)).
		
		(incomingChar codePoint >= 32) ifTrue: [
			output := output, (incomingChar asString).
		].
	].
	Transcript show: 'Last msg: ', output; cr.
	Transcript show: 'recv result: ', (rc asString); cr.
	Transcript show: 'data size:', ((datasz longPointerAt: 1) asInteger asString); cr.

	self assert: rc equals: (IShell PDIP_RECV_DATA).

	rc := ish pdip_send_formatted: pdipt message: ('quit', (Character lf asString)).
	
	displaysz free.
	datasz free.
	displayS free.
	cmem free.

	rc := ish pdip_delete: pdipt status: nil.
	self assert: rc equals: 0.! !

!IShellTest methodsFor: 'cases' stamp: 'ct 12/30/2025 11:26:18'!
testPublic
	| ishell output |
	
	ishell := IShell new.
	ishell exec: #('bc').
	ishell receiveWithTimeout: 2.

	ishell sendWithLf: '4+4' andWait: 1.
	output := ishell receiveWithTimeout: 2.
	Transcript show: 'The output is: ', output; cr.

	ishell sendWithLf: 'quit' andWait: 1.

	ishell delete.! !
PdipCfgT initialize!
Timeval initialize!
