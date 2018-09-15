pragma Warnings (Off);
pragma Ada_95;
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2017 (20170515-63)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_test_concurrent_mergesort" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#7ce52d5d#;
   pragma Export (C, u00001, "test_concurrent_mergesortB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0a55feef#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00005, "ada__containersS");
   u00006 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00007, "system__exception_tableB");
   u00008 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00008, "system__exception_tableS");
   u00009 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00009, "system__soft_linksB");
   u00010 : constant Version_32 := 16#ac24596d#;
   pragma Export (C, u00010, "system__soft_linksS");
   u00011 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00011, "system__parametersB");
   u00012 : constant Version_32 := 16#4c8a8c47#;
   pragma Export (C, u00012, "system__parametersS");
   u00013 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00013, "system__secondary_stackB");
   u00014 : constant Version_32 := 16#88327e42#;
   pragma Export (C, u00014, "system__secondary_stackS");
   u00015 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00015, "system__storage_elementsB");
   u00016 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00016, "system__storage_elementsS");
   u00017 : constant Version_32 := 16#85a06f66#;
   pragma Export (C, u00017, "ada__exceptionsB");
   u00018 : constant Version_32 := 16#1a0dcc03#;
   pragma Export (C, u00018, "ada__exceptionsS");
   u00019 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00019, "ada__exceptions__last_chance_handlerB");
   u00020 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00020, "ada__exceptions__last_chance_handlerS");
   u00021 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00021, "system__exceptionsB");
   u00022 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00022, "system__exceptionsS");
   u00023 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00023, "system__exceptions__machineB");
   u00024 : constant Version_32 := 16#047ef179#;
   pragma Export (C, u00024, "system__exceptions__machineS");
   u00025 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00025, "system__exceptions_debugB");
   u00026 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00026, "system__exceptions_debugS");
   u00027 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00027, "system__img_intB");
   u00028 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00028, "system__img_intS");
   u00029 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#18d5fcc5#;
   pragma Export (C, u00033, "system__traceback__symbolicB");
   u00034 : constant Version_32 := 16#9df1ae6d#;
   pragma Export (C, u00034, "system__traceback__symbolicS");
   u00035 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00035, "ada__exceptions__tracebackB");
   u00036 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00036, "ada__exceptions__tracebackS");
   u00037 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00037, "system__bounded_stringsB");
   u00038 : constant Version_32 := 16#455da021#;
   pragma Export (C, u00038, "system__bounded_stringsS");
   u00039 : constant Version_32 := 16#42315736#;
   pragma Export (C, u00039, "system__crtlS");
   u00040 : constant Version_32 := 16#08e0d717#;
   pragma Export (C, u00040, "system__dwarf_linesB");
   u00041 : constant Version_32 := 16#b1bd2788#;
   pragma Export (C, u00041, "system__dwarf_linesS");
   u00042 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00042, "ada__charactersS");
   u00043 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00043, "ada__characters__handlingB");
   u00044 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00044, "ada__characters__handlingS");
   u00045 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00045, "ada__characters__latin_1S");
   u00046 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00046, "ada__stringsS");
   u00047 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00047, "ada__strings__mapsB");
   u00048 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00048, "ada__strings__mapsS");
   u00049 : constant Version_32 := 16#9dc9b435#;
   pragma Export (C, u00049, "system__bit_opsB");
   u00050 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00050, "system__bit_opsS");
   u00051 : constant Version_32 := 16#0626fdbb#;
   pragma Export (C, u00051, "system__unsigned_typesS");
   u00052 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00052, "ada__strings__maps__constantsS");
   u00053 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00053, "interfacesS");
   u00054 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00054, "system__address_imageB");
   u00055 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00055, "system__address_imageS");
   u00056 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00056, "system__img_unsB");
   u00057 : constant Version_32 := 16#99d2c14c#;
   pragma Export (C, u00057, "system__img_unsS");
   u00058 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00058, "system__ioB");
   u00059 : constant Version_32 := 16#ace27677#;
   pragma Export (C, u00059, "system__ioS");
   u00060 : constant Version_32 := 16#11faaec1#;
   pragma Export (C, u00060, "system__mmapB");
   u00061 : constant Version_32 := 16#08d13e5f#;
   pragma Export (C, u00061, "system__mmapS");
   u00062 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00062, "ada__io_exceptionsS");
   u00063 : constant Version_32 := 16#9d8ecedc#;
   pragma Export (C, u00063, "system__mmap__os_interfaceB");
   u00064 : constant Version_32 := 16#8f4541b8#;
   pragma Export (C, u00064, "system__mmap__os_interfaceS");
   u00065 : constant Version_32 := 16#54632e7c#;
   pragma Export (C, u00065, "system__os_libB");
   u00066 : constant Version_32 := 16#ed466fde#;
   pragma Export (C, u00066, "system__os_libS");
   u00067 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00067, "system__case_utilB");
   u00068 : constant Version_32 := 16#16a9e8ef#;
   pragma Export (C, u00068, "system__case_utilS");
   u00069 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00069, "system__stringsB");
   u00070 : constant Version_32 := 16#4c1f905e#;
   pragma Export (C, u00070, "system__stringsS");
   u00071 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00071, "interfaces__cB");
   u00072 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00072, "interfaces__cS");
   u00073 : constant Version_32 := 16#d0bc914c#;
   pragma Export (C, u00073, "system__object_readerB");
   u00074 : constant Version_32 := 16#7f932442#;
   pragma Export (C, u00074, "system__object_readerS");
   u00075 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00075, "system__val_lliB");
   u00076 : constant Version_32 := 16#a8846798#;
   pragma Export (C, u00076, "system__val_lliS");
   u00077 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00077, "system__val_lluB");
   u00078 : constant Version_32 := 16#7cd4aac9#;
   pragma Export (C, u00078, "system__val_lluS");
   u00079 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00079, "system__val_utilB");
   u00080 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00080, "system__val_utilS");
   u00081 : constant Version_32 := 16#5bbc3f2f#;
   pragma Export (C, u00081, "system__exception_tracesB");
   u00082 : constant Version_32 := 16#167fa1a2#;
   pragma Export (C, u00082, "system__exception_tracesS");
   u00083 : constant Version_32 := 16#d178f226#;
   pragma Export (C, u00083, "system__win32S");
   u00084 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00084, "system__wch_conB");
   u00085 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00085, "system__wch_conS");
   u00086 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00086, "system__wch_stwB");
   u00087 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00087, "system__wch_stwS");
   u00088 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00088, "system__wch_cnvB");
   u00089 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00089, "system__wch_cnvS");
   u00090 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00090, "system__wch_jisB");
   u00091 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00091, "system__wch_jisS");
   u00092 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00092, "system__stack_checkingB");
   u00093 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00093, "system__stack_checkingS");
   u00094 : constant Version_32 := 16#bcec81df#;
   pragma Export (C, u00094, "ada__containers__helpersB");
   u00095 : constant Version_32 := 16#4adfc5eb#;
   pragma Export (C, u00095, "ada__containers__helpersS");
   u00096 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00096, "ada__finalizationS");
   u00097 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00097, "ada__streamsB");
   u00098 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00098, "ada__streamsS");
   u00099 : constant Version_32 := 16#d85792d6#;
   pragma Export (C, u00099, "ada__tagsB");
   u00100 : constant Version_32 := 16#8813468c#;
   pragma Export (C, u00100, "ada__tagsS");
   u00101 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00101, "system__htableB");
   u00102 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00102, "system__htableS");
   u00103 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00103, "system__string_hashB");
   u00104 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00104, "system__string_hashS");
   u00105 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00105, "system__val_unsB");
   u00106 : constant Version_32 := 16#168e1080#;
   pragma Export (C, u00106, "system__val_unsS");
   u00107 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00107, "system__finalization_rootB");
   u00108 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00108, "system__finalization_rootS");
   u00109 : constant Version_32 := 16#70f25dad#;
   pragma Export (C, u00109, "system__atomic_countersB");
   u00110 : constant Version_32 := 16#86fcacb5#;
   pragma Export (C, u00110, "system__atomic_countersS");
   u00111 : constant Version_32 := 16#5fc82639#;
   pragma Export (C, u00111, "system__machine_codeS");
   u00112 : constant Version_32 := 16#09572056#;
   pragma Export (C, u00112, "ada__long_integer_text_ioB");
   u00113 : constant Version_32 := 16#47424823#;
   pragma Export (C, u00113, "ada__long_integer_text_ioS");
   u00114 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00114, "ada__text_ioB");
   u00115 : constant Version_32 := 16#95711eac#;
   pragma Export (C, u00115, "ada__text_ioS");
   u00116 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00116, "interfaces__c_streamsB");
   u00117 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00117, "interfaces__c_streamsS");
   u00118 : constant Version_32 := 16#6f0d52aa#;
   pragma Export (C, u00118, "system__file_ioB");
   u00119 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00119, "system__file_ioS");
   u00120 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00120, "system__file_control_blockS");
   u00121 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00121, "ada__text_io__integer_auxB");
   u00122 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00122, "ada__text_io__integer_auxS");
   u00123 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00123, "ada__text_io__generic_auxB");
   u00124 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00124, "ada__text_io__generic_auxS");
   u00125 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00125, "system__img_biuB");
   u00126 : constant Version_32 := 16#c00475f6#;
   pragma Export (C, u00126, "system__img_biuS");
   u00127 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00127, "system__img_llbB");
   u00128 : constant Version_32 := 16#81c36508#;
   pragma Export (C, u00128, "system__img_llbS");
   u00129 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00129, "system__img_lliB");
   u00130 : constant Version_32 := 16#23efd4e9#;
   pragma Export (C, u00130, "system__img_lliS");
   u00131 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00131, "system__img_llwB");
   u00132 : constant Version_32 := 16#28af469e#;
   pragma Export (C, u00132, "system__img_llwS");
   u00133 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00133, "system__img_wiuB");
   u00134 : constant Version_32 := 16#ae45f264#;
   pragma Export (C, u00134, "system__img_wiuS");
   u00135 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00135, "system__val_intB");
   u00136 : constant Version_32 := 16#7a05ab07#;
   pragma Export (C, u00136, "system__val_intS");
   u00137 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00137, "ada__numericsS");
   u00138 : constant Version_32 := 16#03fc996e#;
   pragma Export (C, u00138, "ada__real_timeB");
   u00139 : constant Version_32 := 16#c3d451b0#;
   pragma Export (C, u00139, "ada__real_timeS");
   u00140 : constant Version_32 := 16#cb56a7b3#;
   pragma Export (C, u00140, "system__taskingB");
   u00141 : constant Version_32 := 16#70384b95#;
   pragma Export (C, u00141, "system__taskingS");
   u00142 : constant Version_32 := 16#c71f56c0#;
   pragma Export (C, u00142, "system__task_primitivesS");
   u00143 : constant Version_32 := 16#fa769fc7#;
   pragma Export (C, u00143, "system__os_interfaceS");
   u00144 : constant Version_32 := 16#22b0e2af#;
   pragma Export (C, u00144, "interfaces__c__stringsB");
   u00145 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00145, "interfaces__c__stringsS");
   u00146 : constant Version_32 := 16#fc754292#;
   pragma Export (C, u00146, "system__task_primitives__operationsB");
   u00147 : constant Version_32 := 16#24684c98#;
   pragma Export (C, u00147, "system__task_primitives__operationsS");
   u00148 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00148, "system__float_controlB");
   u00149 : constant Version_32 := 16#d25cc204#;
   pragma Export (C, u00149, "system__float_controlS");
   u00150 : constant Version_32 := 16#da8ccc08#;
   pragma Export (C, u00150, "system__interrupt_managementB");
   u00151 : constant Version_32 := 16#0f60a80c#;
   pragma Export (C, u00151, "system__interrupt_managementS");
   u00152 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00152, "system__multiprocessorsB");
   u00153 : constant Version_32 := 16#0a0c1e4b#;
   pragma Export (C, u00153, "system__multiprocessorsS");
   u00154 : constant Version_32 := 16#a99e1d66#;
   pragma Export (C, u00154, "system__os_primitivesB");
   u00155 : constant Version_32 := 16#b82f904e#;
   pragma Export (C, u00155, "system__os_primitivesS");
   u00156 : constant Version_32 := 16#b6166bc6#;
   pragma Export (C, u00156, "system__task_lockB");
   u00157 : constant Version_32 := 16#532ab656#;
   pragma Export (C, u00157, "system__task_lockS");
   u00158 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00158, "system__win32__extS");
   u00159 : constant Version_32 := 16#77769007#;
   pragma Export (C, u00159, "system__task_infoB");
   u00160 : constant Version_32 := 16#e54688cf#;
   pragma Export (C, u00160, "system__task_infoS");
   u00161 : constant Version_32 := 16#9471a5c6#;
   pragma Export (C, u00161, "system__tasking__debugB");
   u00162 : constant Version_32 := 16#f1f2435f#;
   pragma Export (C, u00162, "system__tasking__debugS");
   u00163 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00163, "system__concat_2B");
   u00164 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00164, "system__concat_2S");
   u00165 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00165, "system__concat_3B");
   u00166 : constant Version_32 := 16#39d0dd9d#;
   pragma Export (C, u00166, "system__concat_3S");
   u00167 : constant Version_32 := 16#18e0e51c#;
   pragma Export (C, u00167, "system__img_enum_newB");
   u00168 : constant Version_32 := 16#53ec87f8#;
   pragma Export (C, u00168, "system__img_enum_newS");
   u00169 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00169, "system__stack_usageB");
   u00170 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00170, "system__stack_usageS");
   u00171 : constant Version_32 := 16#223045d5#;
   pragma Export (C, u00171, "concurrent_mergesortB");
   u00172 : constant Version_32 := 16#a577161b#;
   pragma Export (C, u00172, "concurrent_mergesortS");
   u00173 : constant Version_32 := 16#55bdc74e#;
   pragma Export (C, u00173, "cpu_counterB");
   u00174 : constant Version_32 := 16#feadfb68#;
   pragma Export (C, u00174, "cpu_counterS");
   u00175 : constant Version_32 := 16#8bdfec1d#;
   pragma Export (C, u00175, "system__tasking__protected_objectsB");
   u00176 : constant Version_32 := 16#a9001c61#;
   pragma Export (C, u00176, "system__tasking__protected_objectsS");
   u00177 : constant Version_32 := 16#72fc64c4#;
   pragma Export (C, u00177, "system__soft_links__taskingB");
   u00178 : constant Version_32 := 16#5ae92880#;
   pragma Export (C, u00178, "system__soft_links__taskingS");
   u00179 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00179, "ada__exceptions__is_null_occurrenceB");
   u00180 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00180, "ada__exceptions__is_null_occurrenceS");
   u00181 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00181, "system__tracesB");
   u00182 : constant Version_32 := 16#c0bde992#;
   pragma Export (C, u00182, "system__tracesS");
   u00183 : constant Version_32 := 16#a3fc4329#;
   pragma Export (C, u00183, "sorting_testsB");
   u00184 : constant Version_32 := 16#2e69aca1#;
   pragma Export (C, u00184, "sorting_testsS");
   u00185 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00185, "system__assertionsB");
   u00186 : constant Version_32 := 16#ff2dadac#;
   pragma Export (C, u00186, "system__assertionsS");
   u00187 : constant Version_32 := 16#4ce79421#;
   pragma Export (C, u00187, "system__fat_lfltS");
   u00188 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00188, "system__finalization_mastersB");
   u00189 : constant Version_32 := 16#695cb8f2#;
   pragma Export (C, u00189, "system__finalization_mastersS");
   u00190 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00190, "system__img_boolB");
   u00191 : constant Version_32 := 16#c779f0d3#;
   pragma Export (C, u00191, "system__img_boolS");
   u00192 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00192, "system__storage_poolsB");
   u00193 : constant Version_32 := 16#114d1f95#;
   pragma Export (C, u00193, "system__storage_poolsS");
   u00194 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00194, "system__pool_globalB");
   u00195 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00195, "system__pool_globalS");
   u00196 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00196, "system__memoryB");
   u00197 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00197, "system__memoryS");
   u00198 : constant Version_32 := 16#d34f9f29#;
   pragma Export (C, u00198, "system__random_numbersB");
   u00199 : constant Version_32 := 16#f1b831a2#;
   pragma Export (C, u00199, "system__random_numbersS");
   u00200 : constant Version_32 := 16#40a8df0e#;
   pragma Export (C, u00200, "system__random_seedB");
   u00201 : constant Version_32 := 16#69b0a863#;
   pragma Export (C, u00201, "system__random_seedS");
   u00202 : constant Version_32 := 16#0d7f1a43#;
   pragma Export (C, u00202, "ada__calendarB");
   u00203 : constant Version_32 := 16#5b279c75#;
   pragma Export (C, u00203, "ada__calendarS");
   u00204 : constant Version_32 := 16#a2250034#;
   pragma Export (C, u00204, "system__storage_pools__subpoolsB");
   u00205 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00205, "system__storage_pools__subpoolsS");
   u00206 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00206, "system__storage_pools__subpools__finalizationB");
   u00207 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00207, "system__storage_pools__subpools__finalizationS");
   u00208 : constant Version_32 := 16#3c420900#;
   pragma Export (C, u00208, "system__stream_attributesB");
   u00209 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00209, "system__stream_attributesS");
   u00210 : constant Version_32 := 16#d8fc9f88#;
   pragma Export (C, u00210, "system__tasking__stagesB");
   u00211 : constant Version_32 := 16#e9cef940#;
   pragma Export (C, u00211, "system__tasking__stagesS");
   u00212 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00212, "system__restrictionsB");
   u00213 : constant Version_32 := 16#c1c3a556#;
   pragma Export (C, u00213, "system__restrictionsS");
   u00214 : constant Version_32 := 16#bc23950c#;
   pragma Export (C, u00214, "system__tasking__initializationB");
   u00215 : constant Version_32 := 16#efd25374#;
   pragma Export (C, u00215, "system__tasking__initializationS");
   u00216 : constant Version_32 := 16#e774edef#;
   pragma Export (C, u00216, "system__tasking__task_attributesB");
   u00217 : constant Version_32 := 16#6bc95a13#;
   pragma Export (C, u00217, "system__tasking__task_attributesS");
   u00218 : constant Version_32 := 16#ab2f8f51#;
   pragma Export (C, u00218, "system__tasking__queuingB");
   u00219 : constant Version_32 := 16#d1ba2fcb#;
   pragma Export (C, u00219, "system__tasking__queuingS");
   u00220 : constant Version_32 := 16#17aa7da7#;
   pragma Export (C, u00220, "system__tasking__protected_objects__entriesB");
   u00221 : constant Version_32 := 16#427cf21f#;
   pragma Export (C, u00221, "system__tasking__protected_objects__entriesS");
   u00222 : constant Version_32 := 16#96bbd7c2#;
   pragma Export (C, u00222, "system__tasking__rendezvousB");
   u00223 : constant Version_32 := 16#ea18a31e#;
   pragma Export (C, u00223, "system__tasking__rendezvousS");
   u00224 : constant Version_32 := 16#6896b958#;
   pragma Export (C, u00224, "system__tasking__entry_callsB");
   u00225 : constant Version_32 := 16#df420580#;
   pragma Export (C, u00225, "system__tasking__entry_callsS");
   u00226 : constant Version_32 := 16#1dc86ab7#;
   pragma Export (C, u00226, "system__tasking__protected_objects__operationsB");
   u00227 : constant Version_32 := 16#ba36ad85#;
   pragma Export (C, u00227, "system__tasking__protected_objects__operationsS");
   u00228 : constant Version_32 := 16#f9053daa#;
   pragma Export (C, u00228, "system__tasking__utilitiesB");
   u00229 : constant Version_32 := 16#14a33d48#;
   pragma Export (C, u00229, "system__tasking__utilitiesS");
   u00230 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00230, "system__traces__taskingB");
   u00231 : constant Version_32 := 16#09f07b39#;
   pragma Export (C, u00231, "system__traces__taskingS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.fat_lflt%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.val_util%s
   --  system.standard_library%s
   --  system.exception_traces%s
   --  ada.exceptions%s
   --  system.wch_stw%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.os_lib%s
   --  system.bit_ops%s
   --  ada.characters.handling%s
   --  ada.exceptions.traceback%s
   --  ada.exceptions.last_chance_handler%s
   --  system.soft_links%s
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.soft_links%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  ada.containers%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.wch_stw%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  interfaces.c%s
   --  system.win32%s
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.os_lib%b
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%b
   --  ada.exceptions.traceback%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.exceptions.last_chance_handler%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  interfaces.c%b
   --  ada.strings.maps%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.object_reader%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.numerics%s
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.val_uns%s
   --  system.val_uns%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools%b
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.val_int%s
   --  system.val_int%b
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking%b
   --  system.task_primitives.operations%b
   --  system.tasking.debug%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.long_integer_text_io%s
   --  ada.long_integer_text_io%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.initialization%b
   --  system.tasking.task_attributes%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  cpu_counter%s
   --  cpu_counter%b
   --  concurrent_mergesort%s
   --  concurrent_mergesort%b
   --  sorting_tests%s
   --  sorting_tests%b
   --  test_concurrent_mergesort%b
   --  END ELABORATION ORDER

end ada_main;
