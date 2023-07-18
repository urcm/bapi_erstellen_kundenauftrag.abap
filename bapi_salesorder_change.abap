*bapi_salesorder_change
* importing value(salesdocument)  type vbeln_va
*  value(order_header_in)  type bapisdh1 optional
*  value(order_header_inx)  type bapisdh1x
*  value(simulation)  type char1 optional
*  value(behave_when_error)  type char1 default space
*  value(int_number_assignment)  type char1 default space
*  value(logic_switch)  type bapisdls optional
*  value(no_status_buf_init)  type char1 default space
* tables return  type standard table of bapiret2 with header line
*  order_item_in  type standard table of bapisditm with header line optional
*  order_item_inx  type standard table of bapisditmx with header line optional
*  partners  type standard table of bapiparnr with header line optional
*  partnerchanges  type standard table of bapiparnrc with header line optional
*  partneraddresses  type standard table of bapiaddr1 with header line optional
*  order_cfgs_ref  type standard table of bapicucfg with header line optional
*  order_cfgs_inst  type standard table of bapicuins with header line optional
*  order_cfgs_part_of  type standard table of bapicuprt with header line optional
*  order_cfgs_value  type standard table of bapicuval with header line optional
*  order_cfgs_blob  type standard table of bapicublb with header line optional
*  order_cfgs_vk  type standard table of bapicuvk with header line optional
*  order_cfgs_refinst  type standard table of bapicuref with header line optional
*  schedule_lines  type standard table of bapischdl with header line optional
*  schedule_linesx  type standard table of bapischdlx with header line optional
*  order_text  type standard table of bapisdtext with header line optional
*  order_keys  type standard table of bapisdkey with header line optional
*  conditions_in  type standard table of bapicond with header line optional
*  conditions_inx  type standard table of bapicondx with header line optional
*  extensionin  type standard table of bapiparex with header line optional
*  extensionex  type standard table of bapiparex with header line optional
*
*
*Documentation
*
*Sales order: Change Sales Order
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  salesdocument   Order Number
*importing  order_header_in   Order Header
*importing  order_header_inx   Sales Order Check List
*importing  simulation   Simulation Mode
*importing  behave_when_error   Error Handling
*importing  int_number_assignment   Internal Item Number Assignment
*importing  logic_switch   SD Checkbox for the Logic Switch
*importing  no_status_buf_init   No Refresh of Status Buffer
*tables  return   Return Code
*tables  order_item_in   Order Items
*tables  order_item_inx   Sales Order Items Check Table
*tables  partners   Communications Fields: SD Document Partner: WWW
*tables  partnerchanges   Partner changes
*tables  partneraddresses   BAPI Reference Structure for Addresses (Org./Company)
*tables  order_cfgs_ref   Configuration: Reference Data
*tables  order_cfgs_inst   Configuration: Instances
*tables  order_cfgs_part_of   Configuration: Part-of Specifications
*tables  order_cfgs_value   Configuration: Characteristic Values
*tables  order_cfgs_blob   Internal Configuration Data (SCE)
*tables  order_cfgs_vk   Configuration: Variant Condition Key
*tables  order_cfgs_refinst   Configuration: Reference Item / Instance
*tables  schedule_lines   Schedule Lines
*tables  schedule_linesx   Check Table for Schedule Lines
*tables  order_text   Texts
*tables  order_keys   Output Table of Reference Keys
*tables  conditions_in   Conditions
*tables  conditions_inx   Conditions Checkbox
*tables  extensionin   Customer Enhancement for VBAK, VBAP, VBEP
*tables  extensionex   Reference Structure for BAPI Parameters ExtensionIn/Extensio

data: gt_return type standard table of bapiret2.

data: lv_salesdocument type vbeln_va .
lv_salesdocument = '47'.
lv_salesdocument = |{ lv_salesdocument width = 10 alpha = in }|.


data: lt_order_header_inx type bapisdh1x.

lt_order_header_inx-updateflag = 'U'.


*********************************************

data: lt_order_items_in type standard table of bapisditm.
data: ls_order_items_in like line of lt_order_items_in.

ls_order_items_in = value #( itm_number = '10' material ='000000000000000216' plant = 'ZM03'
                             target_qty = '5' target_qu = 'EA').

insert ls_order_items_in into table lt_order_items_in.


data: lt_order_items_inx  type standard table of bapisditmx.
data: ls_order_items_inx like line of lt_order_items_inx.

ls_order_items_inx = value #( updateflag = 'I' itm_number = '10' material ='X' plant = 'X'
                             target_qty = 'X' target_qu = 'EA').

insert ls_order_items_inx into table lt_order_items_inx.


call function 'BAPI_SALESORDER_CHANGE'
  exporting
    salesdocument    = lv_salesdocument    " Order Number
*    order_header_in  = lt_order_header_in    " Order Header
    order_header_inx = lt_order_header_inx    " Sales Order Check List
*   simulation       =     " Simulation Mode
*   behave_when_error     = SPACE    " Error Handling
*   int_number_assignment = SPACE    " Internal Item Number Assignment
*   logic_switch     =     " SD Checkbox for the Logic Switch
*   no_status_buf_init    = SPACE    " No Refresh of Status Buffer
  tables
    return           = gt_return    " Return Code
    order_item_in    = lt_order_items_in    " Order Items
    order_item_inx   = lt_order_items_inx    " Sales Order Items Check Table
*   partners         =     " Communications Fields: SD Document Partner: WWW
*   partnerchanges   =     " Partner changes
*   partneraddresses =     " BAPI Reference Structure for Addresses (Org./Company)
*   order_cfgs_ref   =     " Configuration: Reference Data
*   order_cfgs_inst  =     " Configuration: Instances
*   order_cfgs_part_of    =     " Configuration: Part-of Specifications
*   order_cfgs_value =     " Configuration: Characteristic Values
*   order_cfgs_blob  =     " Internal Configuration Data (SCE)
*   order_cfgs_vk    =     " Configuration: Variant Condition Key
*   order_cfgs_refinst    =     " Configuration: Reference Item / Instance
*   schedule_lines   =     " Schedule Lines
*   schedule_linesx  =     " Check Table for Schedule Lines
*   order_text       =     " Texts
*   order_keys       =     " Output Table of Reference Keys
*   conditions_in    =     " Conditions
*   conditions_inx   =     " Conditions Checkbox
*   extensionin      =     " Customer Enhancement for VBAK, VBAP, VBEP
*   extensionex      =     " Reference Structure for BAPI Parameters ExtensionIn/Extensio
  .

call function 'BAPI_TRANSACTION_COMMIT'.
