import _Stream_Create                 "streams.lib" "_Stream_Create"
import _Stream_Seek                   "streams.lib" "_Stream_Seek"
import _Stream_GetCaretPos            "streams.lib" "_Stream_GetCaretPos"
import _Stream_WriteFromMemoryStream  "streams.lib" "_Stream_WriteFromStream"
import _Stream_ReadFromMemoryStream   "streams.lib" "_Stream_ReadFromStream"
import _Stream_WriteByte              "streams.lib" "_Stream_WriteByte"
import _Stream_WriteWord              "streams.lib" "_Stream_WriteWord"
import _Stream_WriteInt               "streams.lib" "_Stream_WriteInt"
import _Stream_WriteFloat             "streams.lib" "_Stream_WriteFloat"
import _Stream_WriteStr               "streams.lib" "_Stream_WriteStr"
import _Stream_ReadByte               "streams.lib" "_Stream_ReadByte"
import _Stream_ReadWord               "streams.lib" "_Stream_ReadWord"
import _Stream_ReadInt                "streams.lib" "_Stream_ReadInt"
import _Stream_ReadFloat              "streams.lib" "_Stream_ReadFloat"
import _Stream_ReadStr                "streams.lib" "_Stream_ReadStr"
import _Stream_Free                   "streams.lib" "_Stream_Free"
import _MemoryStream_Create           "streams.lib" "_MemoryStream_Create"
import _MemoryStream_Free             "streams.lib" "_MemoryStream_Free"
import _FileStream_Create             "streams.lib" "_FileStream_Create"
import _FileStream_Free               "streams.lib" "_FileStream_Free"

word SO_Start         0
word SO_Current       1
word SO_End           2

word FM_Create         0xFF00
word FM_OpenRead       0x0000
word FM_OpenWrite      0x0001
word FM_OpenReadWrite  0x0002

word FM_ShareCompat    0x0000
word FM_ShareExclusive 0x0010
word FM_ShareDenyWrite 0x0020
word FM_ShareDenyRead  0x0030
word FM_ShareDenyNone  0x0040