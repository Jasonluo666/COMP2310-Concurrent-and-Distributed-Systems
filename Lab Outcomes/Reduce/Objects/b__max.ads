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

   Ada_Main_Program_Name : constant String := "_ada_max" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#e1091016#;
   pragma Export (C, u00001, "maxB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0a55feef#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#85a06f66#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#1a0dcc03#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#32a08138#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#ac24596d#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00012, "system__parametersB");
   u00013 : constant Version_32 := 16#4c8a8c47#;
   pragma Export (C, u00013, "system__parametersS");
   u00014 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#88327e42#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#1f63cb3c#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00018, "system__stack_checkingB");
   u00019 : constant Version_32 := 16#bc1fead0#;
   pragma Export (C, u00019, "system__stack_checkingS");
   u00020 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00020, "system__exception_tableB");
   u00021 : constant Version_32 := 16#6f0ee87a#;
   pragma Export (C, u00021, "system__exception_tableS");
   u00022 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00022, "system__exceptionsB");
   u00023 : constant Version_32 := 16#5ac3ecce#;
   pragma Export (C, u00023, "system__exceptionsS");
   u00024 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00024, "system__exceptions__machineB");
   u00025 : constant Version_32 := 16#047ef179#;
   pragma Export (C, u00025, "system__exceptions__machineS");
   u00026 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00026, "system__exceptions_debugB");
   u00027 : constant Version_32 := 16#4c2a78fc#;
   pragma Export (C, u00027, "system__exceptions_debugS");
   u00028 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00028, "system__img_intB");
   u00029 : constant Version_32 := 16#307b61fa#;
   pragma Export (C, u00029, "system__img_intS");
   u00030 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#6c825ffc#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00032, "system__traceback_entriesB");
   u00033 : constant Version_32 := 16#32fb7748#;
   pragma Export (C, u00033, "system__traceback_entriesS");
   u00034 : constant Version_32 := 16#18d5fcc5#;
   pragma Export (C, u00034, "system__traceback__symbolicB");
   u00035 : constant Version_32 := 16#9df1ae6d#;
   pragma Export (C, u00035, "system__traceback__symbolicS");
   u00036 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00036, "ada__containersS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#e865e681#;
   pragma Export (C, u00039, "system__bounded_stringsB");
   u00040 : constant Version_32 := 16#455da021#;
   pragma Export (C, u00040, "system__bounded_stringsS");
   u00041 : constant Version_32 := 16#42315736#;
   pragma Export (C, u00041, "system__crtlS");
   u00042 : constant Version_32 := 16#08e0d717#;
   pragma Export (C, u00042, "system__dwarf_linesB");
   u00043 : constant Version_32 := 16#b1bd2788#;
   pragma Export (C, u00043, "system__dwarf_linesS");
   u00044 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00044, "ada__charactersS");
   u00045 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00045, "ada__characters__handlingB");
   u00046 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00046, "ada__characters__handlingS");
   u00047 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00047, "ada__characters__latin_1S");
   u00048 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00048, "ada__stringsS");
   u00049 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00049, "ada__strings__mapsB");
   u00050 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00050, "ada__strings__mapsS");
   u00051 : constant Version_32 := 16#9dc9b435#;
   pragma Export (C, u00051, "system__bit_opsB");
   u00052 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00052, "system__bit_opsS");
   u00053 : constant Version_32 := 16#0626fdbb#;
   pragma Export (C, u00053, "system__unsigned_typesS");
   u00054 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00054, "ada__strings__maps__constantsS");
   u00055 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00055, "interfacesS");
   u00056 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00056, "system__address_imageB");
   u00057 : constant Version_32 := 16#934c1c02#;
   pragma Export (C, u00057, "system__address_imageS");
   u00058 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00058, "system__img_unsB");
   u00059 : constant Version_32 := 16#99d2c14c#;
   pragma Export (C, u00059, "system__img_unsS");
   u00060 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00060, "system__ioB");
   u00061 : constant Version_32 := 16#ace27677#;
   pragma Export (C, u00061, "system__ioS");
   u00062 : constant Version_32 := 16#11faaec1#;
   pragma Export (C, u00062, "system__mmapB");
   u00063 : constant Version_32 := 16#08d13e5f#;
   pragma Export (C, u00063, "system__mmapS");
   u00064 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00064, "ada__io_exceptionsS");
   u00065 : constant Version_32 := 16#9d8ecedc#;
   pragma Export (C, u00065, "system__mmap__os_interfaceB");
   u00066 : constant Version_32 := 16#8f4541b8#;
   pragma Export (C, u00066, "system__mmap__os_interfaceS");
   u00067 : constant Version_32 := 16#54632e7c#;
   pragma Export (C, u00067, "system__os_libB");
   u00068 : constant Version_32 := 16#ed466fde#;
   pragma Export (C, u00068, "system__os_libS");
   u00069 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00069, "system__case_utilB");
   u00070 : constant Version_32 := 16#16a9e8ef#;
   pragma Export (C, u00070, "system__case_utilS");
   u00071 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00071, "system__stringsB");
   u00072 : constant Version_32 := 16#4c1f905e#;
   pragma Export (C, u00072, "system__stringsS");
   u00073 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00073, "interfaces__cB");
   u00074 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00074, "interfaces__cS");
   u00075 : constant Version_32 := 16#d0bc914c#;
   pragma Export (C, u00075, "system__object_readerB");
   u00076 : constant Version_32 := 16#7f932442#;
   pragma Export (C, u00076, "system__object_readerS");
   u00077 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00077, "system__val_lliB");
   u00078 : constant Version_32 := 16#a8846798#;
   pragma Export (C, u00078, "system__val_lliS");
   u00079 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00079, "system__val_lluB");
   u00080 : constant Version_32 := 16#7cd4aac9#;
   pragma Export (C, u00080, "system__val_lluS");
   u00081 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00081, "system__val_utilB");
   u00082 : constant Version_32 := 16#9e0037c6#;
   pragma Export (C, u00082, "system__val_utilS");
   u00083 : constant Version_32 := 16#5bbc3f2f#;
   pragma Export (C, u00083, "system__exception_tracesB");
   u00084 : constant Version_32 := 16#167fa1a2#;
   pragma Export (C, u00084, "system__exception_tracesS");
   u00085 : constant Version_32 := 16#d178f226#;
   pragma Export (C, u00085, "system__win32S");
   u00086 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00086, "system__wch_conB");
   u00087 : constant Version_32 := 16#29dda3ea#;
   pragma Export (C, u00087, "system__wch_conS");
   u00088 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00088, "system__wch_stwB");
   u00089 : constant Version_32 := 16#04cc8feb#;
   pragma Export (C, u00089, "system__wch_stwS");
   u00090 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00090, "system__wch_cnvB");
   u00091 : constant Version_32 := 16#266a1919#;
   pragma Export (C, u00091, "system__wch_cnvS");
   u00092 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00092, "system__wch_jisB");
   u00093 : constant Version_32 := 16#a61a0038#;
   pragma Export (C, u00093, "system__wch_jisS");
   u00094 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00094, "ada__numericsS");
   u00095 : constant Version_32 := 16#03fc996e#;
   pragma Export (C, u00095, "ada__real_timeB");
   u00096 : constant Version_32 := 16#c3d451b0#;
   pragma Export (C, u00096, "ada__real_timeS");
   u00097 : constant Version_32 := 16#cb56a7b3#;
   pragma Export (C, u00097, "system__taskingB");
   u00098 : constant Version_32 := 16#70384b95#;
   pragma Export (C, u00098, "system__taskingS");
   u00099 : constant Version_32 := 16#c71f56c0#;
   pragma Export (C, u00099, "system__task_primitivesS");
   u00100 : constant Version_32 := 16#fa769fc7#;
   pragma Export (C, u00100, "system__os_interfaceS");
   u00101 : constant Version_32 := 16#22b0e2af#;
   pragma Export (C, u00101, "interfaces__c__stringsB");
   u00102 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00102, "interfaces__c__stringsS");
   u00103 : constant Version_32 := 16#fc754292#;
   pragma Export (C, u00103, "system__task_primitives__operationsB");
   u00104 : constant Version_32 := 16#24684c98#;
   pragma Export (C, u00104, "system__task_primitives__operationsS");
   u00105 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00105, "system__float_controlB");
   u00106 : constant Version_32 := 16#d25cc204#;
   pragma Export (C, u00106, "system__float_controlS");
   u00107 : constant Version_32 := 16#da8ccc08#;
   pragma Export (C, u00107, "system__interrupt_managementB");
   u00108 : constant Version_32 := 16#0f60a80c#;
   pragma Export (C, u00108, "system__interrupt_managementS");
   u00109 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00109, "system__multiprocessorsB");
   u00110 : constant Version_32 := 16#0a0c1e4b#;
   pragma Export (C, u00110, "system__multiprocessorsS");
   u00111 : constant Version_32 := 16#a99e1d66#;
   pragma Export (C, u00111, "system__os_primitivesB");
   u00112 : constant Version_32 := 16#b82f904e#;
   pragma Export (C, u00112, "system__os_primitivesS");
   u00113 : constant Version_32 := 16#b6166bc6#;
   pragma Export (C, u00113, "system__task_lockB");
   u00114 : constant Version_32 := 16#532ab656#;
   pragma Export (C, u00114, "system__task_lockS");
   u00115 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00115, "system__win32__extS");
   u00116 : constant Version_32 := 16#77769007#;
   pragma Export (C, u00116, "system__task_infoB");
   u00117 : constant Version_32 := 16#e54688cf#;
   pragma Export (C, u00117, "system__task_infoS");
   u00118 : constant Version_32 := 16#9471a5c6#;
   pragma Export (C, u00118, "system__tasking__debugB");
   u00119 : constant Version_32 := 16#f1f2435f#;
   pragma Export (C, u00119, "system__tasking__debugS");
   u00120 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00120, "system__concat_2B");
   u00121 : constant Version_32 := 16#300056e8#;
   pragma Export (C, u00121, "system__concat_2S");
   u00122 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00122, "system__concat_3B");
   u00123 : constant Version_32 := 16#39d0dd9d#;
   pragma Export (C, u00123, "system__concat_3S");
   u00124 : constant Version_32 := 16#18e0e51c#;
   pragma Export (C, u00124, "system__img_enum_newB");
   u00125 : constant Version_32 := 16#53ec87f8#;
   pragma Export (C, u00125, "system__img_enum_newS");
   u00126 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00126, "system__stack_usageB");
   u00127 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00127, "system__stack_usageS");
   u00128 : constant Version_32 := 16#d85792d6#;
   pragma Export (C, u00128, "ada__tagsB");
   u00129 : constant Version_32 := 16#8813468c#;
   pragma Export (C, u00129, "ada__tagsS");
   u00130 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00130, "system__htableB");
   u00131 : constant Version_32 := 16#b66232d2#;
   pragma Export (C, u00131, "system__htableS");
   u00132 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00132, "system__string_hashB");
   u00133 : constant Version_32 := 16#143c59ac#;
   pragma Export (C, u00133, "system__string_hashS");
   u00134 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00134, "system__val_unsB");
   u00135 : constant Version_32 := 16#168e1080#;
   pragma Export (C, u00135, "system__val_unsS");
   u00136 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00136, "ada__text_ioB");
   u00137 : constant Version_32 := 16#95711eac#;
   pragma Export (C, u00137, "ada__text_ioS");
   u00138 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00138, "ada__streamsB");
   u00139 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00139, "ada__streamsS");
   u00140 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00140, "interfaces__c_streamsB");
   u00141 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00141, "interfaces__c_streamsS");
   u00142 : constant Version_32 := 16#6f0d52aa#;
   pragma Export (C, u00142, "system__file_ioB");
   u00143 : constant Version_32 := 16#95d1605d#;
   pragma Export (C, u00143, "system__file_ioS");
   u00144 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00144, "ada__finalizationS");
   u00145 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00145, "system__finalization_rootB");
   u00146 : constant Version_32 := 16#7d52f2a8#;
   pragma Export (C, u00146, "system__finalization_rootS");
   u00147 : constant Version_32 := 16#cf3f1b90#;
   pragma Export (C, u00147, "system__file_control_blockS");
   u00148 : constant Version_32 := 16#1b7ca0ce#;
   pragma Export (C, u00148, "reduce_concurrentB");
   u00149 : constant Version_32 := 16#4a6f53cb#;
   pragma Export (C, u00149, "reduce_concurrentS");
   u00150 : constant Version_32 := 16#207d41f7#;
   pragma Export (C, u00150, "reduce_iterativeB");
   u00151 : constant Version_32 := 16#c784d506#;
   pragma Export (C, u00151, "reduce_iterativeS");
   u00152 : constant Version_32 := 16#bcbe6f19#;
   pragma Export (C, u00152, "reduce_recursiveB");
   u00153 : constant Version_32 := 16#e38f3345#;
   pragma Export (C, u00153, "reduce_recursiveS");
   u00154 : constant Version_32 := 16#d34f9f29#;
   pragma Export (C, u00154, "system__random_numbersB");
   u00155 : constant Version_32 := 16#f1b831a2#;
   pragma Export (C, u00155, "system__random_numbersS");
   u00156 : constant Version_32 := 16#40a8df0e#;
   pragma Export (C, u00156, "system__random_seedB");
   u00157 : constant Version_32 := 16#69b0a863#;
   pragma Export (C, u00157, "system__random_seedS");
   u00158 : constant Version_32 := 16#0d7f1a43#;
   pragma Export (C, u00158, "ada__calendarB");
   u00159 : constant Version_32 := 16#5b279c75#;
   pragma Export (C, u00159, "ada__calendarS");
   u00160 : constant Version_32 := 16#96bbd7c2#;
   pragma Export (C, u00160, "system__tasking__rendezvousB");
   u00161 : constant Version_32 := 16#ea18a31e#;
   pragma Export (C, u00161, "system__tasking__rendezvousS");
   u00162 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00162, "system__restrictionsB");
   u00163 : constant Version_32 := 16#c1c3a556#;
   pragma Export (C, u00163, "system__restrictionsS");
   u00164 : constant Version_32 := 16#6896b958#;
   pragma Export (C, u00164, "system__tasking__entry_callsB");
   u00165 : constant Version_32 := 16#df420580#;
   pragma Export (C, u00165, "system__tasking__entry_callsS");
   u00166 : constant Version_32 := 16#bc23950c#;
   pragma Export (C, u00166, "system__tasking__initializationB");
   u00167 : constant Version_32 := 16#efd25374#;
   pragma Export (C, u00167, "system__tasking__initializationS");
   u00168 : constant Version_32 := 16#72fc64c4#;
   pragma Export (C, u00168, "system__soft_links__taskingB");
   u00169 : constant Version_32 := 16#5ae92880#;
   pragma Export (C, u00169, "system__soft_links__taskingS");
   u00170 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00170, "ada__exceptions__is_null_occurrenceB");
   u00171 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00171, "ada__exceptions__is_null_occurrenceS");
   u00172 : constant Version_32 := 16#e774edef#;
   pragma Export (C, u00172, "system__tasking__task_attributesB");
   u00173 : constant Version_32 := 16#6bc95a13#;
   pragma Export (C, u00173, "system__tasking__task_attributesS");
   u00174 : constant Version_32 := 16#8bdfec1d#;
   pragma Export (C, u00174, "system__tasking__protected_objectsB");
   u00175 : constant Version_32 := 16#a9001c61#;
   pragma Export (C, u00175, "system__tasking__protected_objectsS");
   u00176 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00176, "system__tracesB");
   u00177 : constant Version_32 := 16#c0bde992#;
   pragma Export (C, u00177, "system__tracesS");
   u00178 : constant Version_32 := 16#17aa7da7#;
   pragma Export (C, u00178, "system__tasking__protected_objects__entriesB");
   u00179 : constant Version_32 := 16#427cf21f#;
   pragma Export (C, u00179, "system__tasking__protected_objects__entriesS");
   u00180 : constant Version_32 := 16#1dc86ab7#;
   pragma Export (C, u00180, "system__tasking__protected_objects__operationsB");
   u00181 : constant Version_32 := 16#ba36ad85#;
   pragma Export (C, u00181, "system__tasking__protected_objects__operationsS");
   u00182 : constant Version_32 := 16#ab2f8f51#;
   pragma Export (C, u00182, "system__tasking__queuingB");
   u00183 : constant Version_32 := 16#d1ba2fcb#;
   pragma Export (C, u00183, "system__tasking__queuingS");
   u00184 : constant Version_32 := 16#f9053daa#;
   pragma Export (C, u00184, "system__tasking__utilitiesB");
   u00185 : constant Version_32 := 16#14a33d48#;
   pragma Export (C, u00185, "system__tasking__utilitiesS");
   u00186 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00186, "system__traces__taskingB");
   u00187 : constant Version_32 := 16#09f07b39#;
   pragma Export (C, u00187, "system__traces__taskingS");
   u00188 : constant Version_32 := 16#d8fc9f88#;
   pragma Export (C, u00188, "system__tasking__stagesB");
   u00189 : constant Version_32 := 16#e9cef940#;
   pragma Export (C, u00189, "system__tasking__stagesS");
   u00190 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00190, "system__memoryB");
   u00191 : constant Version_32 := 16#6bdde70c#;
   pragma Export (C, u00191, "system__memoryS");

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
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
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
   --  system.img_uns%s
   --  system.img_uns%b
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
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.containers%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.bounded_strings%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%s
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
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.bounded_strings%b
   --  ada.exceptions.last_chance_handler%b
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
   --  system.file_io%s
   --  system.file_io%b
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
   --  reduce_concurrent%s
   --  reduce_concurrent%b
   --  reduce_iterative%s
   --  reduce_iterative%b
   --  reduce_recursive%s
   --  reduce_recursive%b
   --  max%b
   --  END ELABORATION ORDER

end ada_main;
