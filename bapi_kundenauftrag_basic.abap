report zur_create_sales_order_basic.

types: begin of ty_sales_order,
         sales_doc_type type auart,
         sales_org      type vkorg,
         dist_channel   type vtweg,
         division       type spart,
         customer       type kunnr,
         material       type matnr,
         order_quantity type kwmeng, 
         plant          type werks, 
       end of ty_sales_order.

data: gt_sales_order type standard table of ty_sales_order,
      g_sales_order  type ty_sales_order,
      gv_kunnr       type kunnr,
      gv_matnr       type matnr.


data: gs_order_header_in     type bapisdhd1,
      gs_order_header_inx    type bapisdhd1x,
      gv_salesdocument       type  bapivbeln-vbeln,
      gt_salesdocument       like table of gv_salesdocument,
      gt_return              type table of bapiret2,
      gt_order_items_in      type table of bapisditm,
      gs_order_items_in      type bapisditm,
      gt_order_items_inx     type table of bapisditmx,
      gs_order_items_inx     type bapisditmx,
      gt_order_partners      type table of bapiparnr,
      gs_order_partners      type  bapiparnr,
      gt_order_schedules_in  type table of bapischdl,
      gs_order_schedules_in  type bapischdl,
      gt_order_schedules_inx type table of  bapischdlx,
      gs_order_schedules_inx type bapischdlx.

start-of-selection.

******* den Kundenauftrag Header ausfüllen ****************

  gs_order_header_in-doc_type     = 'OR1'   .
  gs_order_header_in-sales_org    = '0001'  .
  gs_order_header_in-distr_chan   = '01'    .
  gs_order_header_in-division     = '01'    .
  gs_order_header_in-purch_no_c   = 'PP'    .

  gs_order_header_inx-updateflag   =  'X' .
  gs_order_header_inx-doc_type     =  'X' .
  gs_order_header_inx-sales_org    =  'X' .
  gs_order_header_inx-distr_chan   =  'X' .
  gs_order_header_inx-division     =  'X' .
  gs_order_header_inx-purch_no_c   =  'X' .
  
  
  ******* Partnertabelle ausfüllen ****************


  gv_kunnr = '0000000021'.


  call function 'CONVERSION_EXIT_ALPHA_INPUT'
    exporting
      input  = gv_kunnr
    importing
      output = gv_kunnr.
      
      
  gs_order_partners-partn_role = 'AG'. " sold-to party
  gs_order_partners-partn_numb = gv_kunnr.
  append gs_order_partners to gt_order_partners.
  clear: gs_order_partners.
  
  gs_order_partners-partn_role = 'RE'." bill-to party
  gs_order_partners-partn_numb = gv_kunnr.
  append gs_order_partners to gt_order_partners.
  clear: gs_order_partners.
  
  gs_order_partners-partn_role = 'RG'. " payer
  gs_order_partners-partn_numb = gv_kunnr.
  append gs_order_partners to gt_order_partners.
  clear: gs_order_partners.

  gs_order_partners-partn_role = 'WE'. " ship-to party
  gs_order_partners-partn_numb = gv_kunnr.
  append gs_order_partners to gt_order_partners.
  clear: gs_order_partners.
  
  
******* Items ausfüllen ****************

  gv_matnr = '000000000000000096'.
  
  call function 'CONVERSION_EXIT_ALPHA_INPUT'
    exporting
      input  = gv_kunnr
    importing
      output = gv_kunnr.
      
  gs_order_partners-partn_role = 'AG'. " sold-to party
  gs_order_partners-partn_numb = gv_kunnr.
  append gs_order_partners to gt_order_partners.
  clear: gs_order_partners.
  
  gs_order_items_in-itm_number  = '10'.
  gs_order_items_in-material    = gv_matnr.
  gs_order_items_in-plant       = 'Z730'.
  gs_order_items_in-target_qty  = '5'.
  append gs_order_items_in to gt_order_items_in.
  clear: gs_order_items_in.
  
  gs_order_items_inx-itm_number  = '10'.
  gs_order_items_inx-material    = 'X'.
  gs_order_items_inx-plant       = 'X'.
  gs_order_items_inx-target_qty  = 'X'.
  append gs_order_items_inx to gt_order_items_inx.
  clear: gs_order_items_inx.
  
  
******* Schedule Line ausfüllen ****************

  gs_order_schedules_in-itm_number = '10'.
  gs_order_schedules_in-req_qty    = '10'.
  append gs_order_schedules_in to gt_order_schedules_in.
  clear: gs_order_schedules_in.
  
  gs_order_schedules_inx-itm_number = '10'.
  gs_order_schedules_inx-req_qty    = 'X'.
  gs_order_schedules_inx-updateflag = 'X'.
  append gs_order_schedules_inx to gt_order_schedules_inx.
  clear: gs_order_schedules_inx.

  call function 'BAPI_SALESORDER_CREATEFROMDAT2'
    exporting
*     SALESDOCUMENTIN     =
      order_header_in     = gs_order_header_in
      order_header_inx    = gs_order_header_inx
*     SENDER              =
*     BINARY_RELATIONSHIPTYPE       =
*     INT_NUMBER_ASSIGNMENT         =
*     BEHAVE_WHEN_ERROR   =
*     LOGIC_SWITCH        =
*     TESTRUN             =
*     CONVERT             = ' '
    importing
      salesdocument       = gv_salesdocument
    tables
      return              = gt_return
      order_items_in      = gt_order_items_in
      order_items_inx     = gt_order_items_inx
      order_partners      = gt_order_partners
      order_schedules_in  = gt_order_schedules_in
      order_schedules_inx = gt_order_schedules_inx
*     ORDER_CONDITIONS_IN =
*     ORDER_CONDITIONS_INX=
*     ORDER_CFGS_REF      =
*     ORDER_CFGS_INST     =
*     ORDER_CFGS_PART_OF  =
*     ORDER_CFGS_VALUE    =
*     ORDER_CFGS_BLOB     =
*     ORDER_CFGS_VK       =
*     ORDER_CFGS_REFINST  =
*     ORDER_CCARD         =
*     ORDER_TEXT          =
*     ORDER_KEYS          =
*     EXTENSIONIN         =
*     PARTNERADDRESSES    =
*     EXTENSIONEX         =
    .
    
   if gv_salesdocument is not initial.

    call function 'BAPI_TRANSACTION_COMMIT'
      exporting
        wait = 'X'
*     IMPORTING
*       RETURN        =
      .   
    
