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

