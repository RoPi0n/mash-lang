; ** Application **
import _Application_Initialize     "forms_api.lib"       "_Application_Initialize"
import _Application_Run            "forms_api.lib"       "_Application_Run"
import _Application_Terminate      "forms_api.lib"       "_Application_Terminate"
import _Application_CreateForm     "forms_api.lib"       "_Application_CreateForm"

; ** Form **
import _Form_SetWidth              "forms_api.lib"       "_Form_SetWidth"
import _Form_SetHeight             "forms_api.lib"       "_Form_SetHeight"
import _Form_GetWidth              "forms_api.lib"       "_Form_GetWidth"
import _Form_GetHeight             "forms_api.lib"       "_Form_GetHeight"
import _Form_SetLeft               "forms_api.lib"       "_Form_SetLeft"
import _Form_SetTop                "forms_api.lib"       "_Form_SetTop"
import _Form_GetLeft               "forms_api.lib"       "_Form_GetLeft"
import _Form_GetTop                "forms_api.lib"       "_Form_GetTop"
import _Form_SetColor              "forms_api.lib"       "_Form_SetColor"
import _Form_GetColor              "forms_api.lib"       "_Form_GetColor"
import _Form_SetCaption            "forms_api.lib"       "_Form_SetCaption"
import _Form_GetCaption            "forms_api.lib"       "_Form_GetCaption"
import _Form_Show                  "forms_api.lib"       "_Form_Show"
import _Form_Hide                  "forms_api.lib"       "_Form_Hide"
import _Form_WaitForEvent          "forms_api.lib"       "_Form_WaitForEvent"
import _Form_GetLastEvent          "forms_api.lib"       "_Form_GetLastEvent"
import _Form_LastEventArgCount     "forms_api.lib"       "_Form_LastEventArgCount"
import _Form_LastEventArgAt        "forms_api.lib"       "_Form_LastEventArgAt"
import _Form_GetCanvas             "forms_api.lib"       "_Form_GetCanvas"

; ** Canvas **

import _Canvas_MoveTo              "forms_api.lib"       "_Canvas_MoveTo"
import _Canvas_LineTo              "forms_api.lib"       "_Canvas_LineTo"
import _Canvas_SetPenColor         "forms_api.lib"       "_Canvas_SetPenColor"
import _Canvas_GetPenColor         "forms_api.lib"       "_Canvas_GetPenColor"

; ** Constants **
word   EVT_FormActivate           1
word   EVT_FormChangeBounds       2
word   EVT_FormClick              3
word   EVT_FormClose              4
word   EVT_FormCloseQuery         5
word   EVT_FormContextPopup       6
word   EVT_FormDblClick           7
word   EVT_FormDeactivate         8
word   EVT_FormDockDrop           10
word   EVT_FormDockOver           11
word   EVT_FormDragDrop           12
word   EVT_FormDragOver           13
word   EVT_FormDropFiles          14
word   EVT_FormEndDock            15
word   EVT_FormGetSiteInfo        16
word   EVT_FormHelp               17
word   EVT_FormHide               18
word   EVT_FormKeyDown            19
word   EVT_FormKeyPress           20
word   EVT_FormKeyUp              21
word   EVT_FormMouseDown          22
word   EVT_FormMouseEnter         23
word   EVT_FormMouseLeave         24
word   EVT_FormMouseMove          25
word   EVT_FormMouseUp            26
word   EVT_FormMouseWheel         27
word   EVT_FormMouseWheelDown     28
word   EVT_FormMouseWheelUp       29
word   EVT_FormResize             30
word   EVT_FormShortCut           31
word   EVT_FormShow               32
word   EVT_FormShowHint           33
word   EVT_FormStartDock          34
word   EVT_FormUnDock             35
word   EVT_FormUTF8KeyPress       36
word   EVT_FormWindowStateChange  37
word   EVT_FormPaint              38