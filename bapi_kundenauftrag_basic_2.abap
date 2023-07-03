*bapi_salesorder_createfromdat2
* importing value(salesdocumentin)  type vbeln_va optional
*  value(order_header_in)  type bapisdhd1
*  value(order_header_inx)  type bapisdhd1x optional
*  value(sender)  type bapi_sender optional
*  value(binary_relationshiptype)  type binreltyp optional
*  value(int_number_assignment)  type char1 optional
*  value(behave_when_error)  type char1 optional
*  value(logic_switch)  type bapisdls optional
*  value(testrun)  type char1 optional
*  value(convert)  type char1 default space
* exporting value(salesdocument)  type vbeln_va
* tables return  type standard table of bapiret2 with header line optional
*  order_items_in  type standard table of bapisditm with header line optional
*  order_items_inx  type standard table of bapisditmx with header line optional
*  order_partners  type standard table of bapiparnr with header line
*  order_schedules_in  type standard table of bapischdl with header line optional
*  order_schedules_inx  type standard table of bapischdlx with header line optional
*  order_conditions_in  type standard table of bapicond with header line optional
*  order_conditions_inx  type standard table of bapicondx with header line optional
*  order_cfgs_ref  type standard table of bapicucfg with header line optional
*  order_cfgs_inst  type standard table of bapicuins with header line optional
*  order_cfgs_part_of  type standard table of bapicuprt with header line optional
*  order_cfgs_value  type standard table of bapicuval with header line optional
*  order_cfgs_blob  type standard table of bapicublb with header line optional
*  order_cfgs_vk  type standard table of bapicuvk with header line optional
*  order_cfgs_refinst  type standard table of bapicuref with header line optional
*  order_ccard  type standard table of bapiccard with header line optional
*  order_text  type standard table of bapisdtext with header line optional
*  order_keys  type standard table of bapisdkey with header line optional
*  extensionin  type standard table of bapiparex with header line optional
*  partneraddresses  type standard table of bapiaddr1 with header line optional
*  extensionex  type standard table of bapiparex with header line optional
*
*
*Documentation
*
*Sales order: Create Sales Order
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  salesdocumentin   Sales and Distribution Document Number
*importing  order_header_in   Order Header
*importing  order_header_inx   Sales Order Check List
*importing  sender   Logical System - Sender
*importing  binary_relationshiptype   Binary Relationship Type (Private)
*importing  int_number_assignment   Internal Item Number Assignment
*importing  behave_when_error   Error Handling
*importing  logic_switch   Internal Control Parameter
*importing  testrun   Test Run
*importing  convert   Conversion of Partner Function + Order Type
*exporting  salesdocument   Number of Generated Document
*tables  return   Return Messages
*tables  order_items_in   Item Data
*tables  order_items_inx   Item Data Checkbox
*tables  order_partners   Document Partner
*tables  order_schedules_in   Schedule Line Data
*tables  order_schedules_inx   Checkbox Schedule Line Data
*tables  order_conditions_in   Conditions
*tables  order_conditions_inx   Conditions Checkbox
*tables  order_cfgs_ref   Configuration: Reference Data
*tables  order_cfgs_inst   Configuration: Instances
*tables  order_cfgs_part_of   Configuration: Part-of Specifications
*tables  order_cfgs_value   Configuration: Characteristic Values
*tables  order_cfgs_blob   Configuration: BLOB Internal Data (SCE)
*tables  order_cfgs_vk   Configuration: Variant Condition Key
*tables  order_cfgs_refinst   Configuration: Reference Item / Instance
*tables  order_ccard   Credit Card Data
*tables  order_text   Texts
*tables  order_keys   Output Table of Reference Keys
*tables  extensionin   Customer Enhancement for VBAK, VBAP, VBEP
*tables  partneraddresses   BAPI Reference Structure for Addresses (Org./Company)
*tables  extensionex   Reference Structure for BAPI Parameters ExtensionIn/Extensio

****** Header ***************************************

data(gt_order_header_in) = value bapisdhd1( doc_type = 'OR1'
                                           sales_org = 'ZM03'
                                           distr_chan = 'O1'
                                           division = 'P1'
                                           purch_no_c = 'PP' ).

data(gt_order_header_inx) = value bapisdhd1x(
                                         updateflag  = 'I'
                                         doc_type = 'X'
                                         sales_org = 'X'
                                         distr_chan = 'X'
                                         division = 'X'
                                         purch_no_c = 'X' ).
