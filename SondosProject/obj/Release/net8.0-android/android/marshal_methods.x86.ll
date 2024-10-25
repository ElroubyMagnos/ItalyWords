; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [142 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [284 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 115
	i32 26230656, ; 1: Microsoft.Extensions.DependencyModel => 0x1903f80 => 49
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 132
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 58
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 123
	i32 159306688, ; 6: System.ComponentModel.Annotations => 0x97ed3c0 => 97
	i32 165246403, ; 7: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 67
	i32 182336117, ; 8: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 85
	i32 195452805, ; 9: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 10: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 100
	i32 280992041, ; 12: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 63
	i32 336156722, ; 15: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 16: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 74
	i32 347068432, ; 17: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 61
	i32 356389973, ; 18: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 374914964, ; 19: System.Transactions.Local => 0x1658bf94 => 134
	i32 379916513, ; 20: System.Threading.Thread.dll => 0x16a510e1 => 132
	i32 385762202, ; 21: System.Memory.dll => 0x16fe439a => 113
	i32 395744057, ; 22: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 23: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 96
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 73
	i32 469710990, ; 26: System.dll => 0x1bff388e => 136
	i32 498788369, ; 27: System.ObjectModel => 0x1dbae811 => 119
	i32 500358224, ; 28: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 29: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 30: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 53
	i32 530272170, ; 31: System.Linq.Queryable => 0x1f9b4faa => 111
	i32 539058512, ; 32: Microsoft.Extensions.Logging => 0x20216150 => 50
	i32 592146354, ; 33: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 34: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 35: Xamarin.AndroidX.CustomView => 0x2568904f => 71
	i32 627931235, ; 36: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 645526868, ; 37: SondosProject => 0x2679f554 => 91
	i32 662205335, ; 38: System.Text.Encodings.Web.dll => 0x27787397 => 129
	i32 672442732, ; 39: System.Collections.Concurrent => 0x2814a96c => 92
	i32 688181140, ; 40: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 41: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 42: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 43: System.Runtime.Loader.dll => 0x2b15ed29 => 124
	i32 748832960, ; 44: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 59
	i32 759454413, ; 45: System.Net.Requests => 0x2d445acd => 117
	i32 775507847, ; 46: System.IO.Compression => 0x2e394f87 => 109
	i32 777317022, ; 47: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 48: Microsoft.Extensions.Options => 0x2f0980eb => 52
	i32 804715423, ; 49: System.Data.Common => 0x2ff6fb9f => 102
	i32 823281589, ; 50: System.Private.Uri.dll => 0x311247b5 => 120
	i32 830298997, ; 51: System.IO.Compression.Brotli => 0x317d5b75 => 108
	i32 904024072, ; 52: System.ComponentModel.Primitives.dll => 0x35e25008 => 98
	i32 926902833, ; 53: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 54: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 74
	i32 975236339, ; 55: System.Diagnostics.Tracing => 0x3a20ecf3 => 105
	i32 992768348, ; 56: System.Collections.dll => 0x3b2c715c => 96
	i32 1012816738, ; 57: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 84
	i32 1019214401, ; 58: System.Drawing => 0x3cbffa41 => 107
	i32 1028951442, ; 59: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 48
	i32 1029334545, ; 60: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 61: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 64
	i32 1036536393, ; 62: System.Drawing.Primitives.dll => 0x3dc84a49 => 106
	i32 1044663988, ; 63: System.Linq.Expressions.dll => 0x3e444eb4 => 110
	i32 1052210849, ; 64: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 76
	i32 1082857460, ; 65: System.ComponentModel.TypeConverter => 0x408b17f4 => 99
	i32 1084122840, ; 66: Xamarin.Kotlin.StdLib => 0x409e66d8 => 89
	i32 1098259244, ; 67: System => 0x41761b2c => 136
	i32 1118262833, ; 68: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1157931901, ; 69: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 40
	i32 1168523401, ; 70: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 71: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 81
	i32 1202000627, ; 72: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 40
	i32 1203215381, ; 73: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 74: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 44
	i32 1214827643, ; 75: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1234928153, ; 76: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 77: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 78: SQLitePCLRaw.core.dll => 0x4d0585a0 => 60
	i32 1293217323, ; 79: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 72
	i32 1324164729, ; 80: System.Linq => 0x4eed2679 => 112
	i32 1373134921, ; 81: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 82: Xamarin.AndroidX.SavedState => 0x52114ed3 => 84
	i32 1406073936, ; 83: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 68
	i32 1408764838, ; 84: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 126
	i32 1430672901, ; 85: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 86: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 87: System.Collections.Immutable.dll => 0x5718a9ef => 93
	i32 1462112819, ; 88: System.IO.Compression.dll => 0x57261233 => 109
	i32 1469204771, ; 89: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 65
	i32 1470490898, ; 90: Microsoft.Extensions.Primitives => 0x57a5e912 => 53
	i32 1479771757, ; 91: System.Collections.Immutable => 0x5833866d => 93
	i32 1480492111, ; 92: System.IO.Compression.Brotli.dll => 0x583e844f => 108
	i32 1490351284, ; 93: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 38
	i32 1493001747, ; 94: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 95: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 96: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 131
	i32 1551623176, ; 97: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 98: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 78
	i32 1624863272, ; 99: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 87
	i32 1634654947, ; 100: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 101: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 70
	i32 1639515021, ; 102: System.Net.Http.dll => 0x61b9038d => 114
	i32 1639986890, ; 103: System.Text.RegularExpressions => 0x61c036ca => 131
	i32 1657153582, ; 104: System.Runtime => 0x62c6282e => 127
	i32 1658251792, ; 105: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 88
	i32 1677501392, ; 106: System.Net.Primitives.dll => 0x63fca3d0 => 116
	i32 1679769178, ; 107: System.Security.Cryptography => 0x641f3e5a => 128
	i32 1688112883, ; 108: Microsoft.Data.Sqlite => 0x649e8ef3 => 38
	i32 1689493916, ; 109: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 39
	i32 1711441057, ; 110: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 61
	i32 1729485958, ; 111: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 66
	i32 1736233607, ; 112: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 113: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 114: System.Transactions.Local.dll => 0x67fe8db2 => 134
	i32 1763938596, ; 115: System.Diagnostics.TraceSource.dll => 0x69239124 => 104
	i32 1766324549, ; 116: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 85
	i32 1770582343, ; 117: Microsoft.Extensions.Logging.dll => 0x6988f147 => 50
	i32 1780572499, ; 118: Mono.Android.Runtime.dll => 0x6a216153 => 140
	i32 1782862114, ; 119: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 120: Xamarin.AndroidX.Fragment => 0x6a96652d => 73
	i32 1793755602, ; 121: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 122: Xamarin.AndroidX.Loader => 0x6bcd3296 => 78
	i32 1813058853, ; 123: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 89
	i32 1813201214, ; 124: Xamarin.Google.Android.Material => 0x6c13413e => 88
	i32 1818569960, ; 125: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 82
	i32 1824722060, ; 126: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 126
	i32 1828688058, ; 127: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 51
	i32 1842015223, ; 128: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 129: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 130: System.Linq.Expressions => 0x6ec71a65 => 110
	i32 1875935024, ; 131: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1886040351, ; 132: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 42
	i32 1910275211, ; 133: System.Collections.NonGeneric.dll => 0x71dc7c8b => 94
	i32 1968388702, ; 134: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 45
	i32 2003115576, ; 135: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2014489277, ; 136: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 42
	i32 2019465201, ; 137: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 76
	i32 2025202353, ; 138: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 139: System.Private.Xml => 0x79eb68ee => 121
	i32 2055257422, ; 140: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 75
	i32 2066184531, ; 141: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 142: System.Diagnostics.TraceSource => 0x7b6f419e => 104
	i32 2079903147, ; 143: System.Runtime.dll => 0x7bf8cdab => 127
	i32 2090596640, ; 144: System.Numerics.Vectors => 0x7c9bf920 => 118
	i32 2103459038, ; 145: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 62
	i32 2127167465, ; 146: System.Console => 0x7ec9ffe9 => 101
	i32 2142473426, ; 147: System.Collections.Specialized => 0x7fb38cd2 => 95
	i32 2159891885, ; 148: Microsoft.Maui => 0x80bd55ad => 56
	i32 2169148018, ; 149: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 150: Microsoft.Extensions.Options.dll => 0x820d22b3 => 52
	i32 2192057212, ; 151: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 51
	i32 2193016926, ; 152: System.ObjectModel.dll => 0x82b6c85e => 119
	i32 2197979891, ; 153: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 49
	i32 2201107256, ; 154: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 90
	i32 2201231467, ; 155: System.Net.Http => 0x8334206b => 114
	i32 2207618523, ; 156: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 157: Microsoft.EntityFrameworkCore => 0x86487ec9 => 39
	i32 2266799131, ; 158: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 46
	i32 2270573516, ; 159: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 160: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 83
	i32 2303942373, ; 161: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 162: System.Private.CoreLib.dll => 0x896b7878 => 138
	i32 2340441535, ; 163: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 122
	i32 2353062107, ; 164: System.Net.Primitives => 0x8c40e0db => 116
	i32 2368005991, ; 165: System.Xml.ReaderWriter.dll => 0x8d24e767 => 135
	i32 2371007202, ; 166: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 45
	i32 2376049251, ; 167: SondosProject.dll => 0x8d9fa263 => 91
	i32 2395872292, ; 168: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 169: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 170: System.Console.dll => 0x912896e5 => 101
	i32 2465273461, ; 171: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 59
	i32 2471841756, ; 172: netstandard.dll => 0x93554fdc => 137
	i32 2475788418, ; 173: Java.Interop.dll => 0x93918882 => 139
	i32 2480646305, ; 174: Microsoft.Maui.Controls => 0x93dba8a1 => 54
	i32 2550873716, ; 175: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 176: System.Text.Encodings.Web => 0x9930ee42 => 129
	i32 2593496499, ; 177: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 178: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 90
	i32 2617129537, ; 179: System.Private.Xml.dll => 0x9bfe3a41 => 121
	i32 2620871830, ; 180: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 70
	i32 2626831493, ; 181: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2634653062, ; 182: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 41
	i32 2663698177, ; 183: System.Runtime.Loader => 0x9ec4cf01 => 124
	i32 2665622720, ; 184: System.Drawing.Primitives => 0x9ee22cc0 => 106
	i32 2676780864, ; 185: System.Data.Common.dll => 0x9f8c6f40 => 102
	i32 2724373263, ; 186: System.Runtime.Numerics.dll => 0xa262a30f => 125
	i32 2732626843, ; 187: Xamarin.AndroidX.Activity => 0xa2e0939b => 63
	i32 2737747696, ; 188: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 65
	i32 2752995522, ; 189: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 190: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 55
	i32 2764765095, ; 191: Microsoft.Maui.dll => 0xa4caf7a7 => 56
	i32 2778768386, ; 192: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 86
	i32 2785988530, ; 193: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 194: Microsoft.Maui.Graphics => 0xa7008e0b => 58
	i32 2806116107, ; 195: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 196: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 68
	i32 2831556043, ; 197: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847789619, ; 198: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 41
	i32 2853208004, ; 199: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 86
	i32 2861189240, ; 200: Microsoft.Maui.Essentials => 0xaa8a4878 => 57
	i32 2868488919, ; 201: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 202: System.Private.CoreLib => 0xad6f1e8a => 138
	i32 2916838712, ; 203: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 87
	i32 2919462931, ; 204: System.Numerics.Vectors.dll => 0xae037813 => 118
	i32 2959614098, ; 205: System.ComponentModel.dll => 0xb0682092 => 100
	i32 2978675010, ; 206: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 72
	i32 3038032645, ; 207: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 208: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 79
	i32 3059408633, ; 209: Mono.Android.Runtime => 0xb65adef9 => 140
	i32 3059793426, ; 210: System.ComponentModel.Primitives => 0xb660be12 => 98
	i32 3069363400, ; 211: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 43
	i32 3077302341, ; 212: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3147165239, ; 213: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 105
	i32 3178803400, ; 214: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 80
	i32 3195844289, ; 215: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 43
	i32 3220365878, ; 216: System.Threading => 0xbff2e236 => 133
	i32 3258312781, ; 217: Xamarin.AndroidX.CardView => 0xc235e84d => 66
	i32 3265493905, ; 218: System.Linq.Queryable.dll => 0xc2a37b91 => 111
	i32 3280506390, ; 219: System.ComponentModel.Annotations.dll => 0xc3888e16 => 97
	i32 3305363605, ; 220: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 221: System.Net.Requests.dll => 0xc5b097e4 => 117
	i32 3317135071, ; 222: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 71
	i32 3346324047, ; 223: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 81
	i32 3357674450, ; 224: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 225: System.Text.Json => 0xc82afec1 => 130
	i32 3360279109, ; 226: SQLitePCLRaw.core => 0xc849ca45 => 60
	i32 3362522851, ; 227: Xamarin.AndroidX.Core => 0xc86c06e3 => 69
	i32 3366347497, ; 228: Java.Interop => 0xc8a662e9 => 139
	i32 3374999561, ; 229: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 83
	i32 3381016424, ; 230: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 231: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 47
	i32 3430777524, ; 232: netstandard => 0xcc7d82b4 => 137
	i32 3463511458, ; 233: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 234: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 99
	i32 3476120550, ; 235: Mono.Android => 0xcf3163e6 => 141
	i32 3479583265, ; 236: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 237: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 238: System.Text.Json.dll => 0xcfbaacae => 130
	i32 3580758918, ; 239: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 240: System.Linq.dll => 0xd715a361 => 112
	i32 3624195450, ; 241: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 122
	i32 3641597786, ; 242: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 75
	i32 3643446276, ; 243: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 244: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 80
	i32 3657292374, ; 245: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 46
	i32 3660523487, ; 246: System.Net.NetworkInformation => 0xda2f27df => 115
	i32 3672681054, ; 247: Mono.Android.dll => 0xdae8aa5e => 141
	i32 3697841164, ; 248: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 249: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 79
	i32 3748608112, ; 250: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 103
	i32 3754567612, ; 251: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 62
	i32 3786282454, ; 252: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 67
	i32 3792276235, ; 253: System.Collections.NonGeneric => 0xe2098b0b => 94
	i32 3802395368, ; 254: System.Collections.Specialized.dll => 0xe2a3f2e8 => 95
	i32 3817368567, ; 255: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 256: System.Security.Cryptography.dll => 0xe3df9d2b => 128
	i32 3841636137, ; 257: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 48
	i32 3849253459, ; 258: System.Runtime.InteropServices.dll => 0xe56ef253 => 123
	i32 3889960447, ; 259: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 260: System.Collections.Concurrent.dll => 0xe839deed => 92
	i32 3896760992, ; 261: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 69
	i32 3928044579, ; 262: System.Xml.ReaderWriter => 0xea213423 => 135
	i32 3931092270, ; 263: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 82
	i32 3955647286, ; 264: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 64
	i32 3980434154, ; 265: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 266: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 267: System.Memory => 0xeff49a63 => 113
	i32 4046471985, ; 268: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 55
	i32 4073602200, ; 269: System.Threading.dll => 0xf2ce3c98 => 133
	i32 4094352644, ; 270: Microsoft.Maui.Essentials.dll => 0xf40add04 => 57
	i32 4099507663, ; 271: System.Drawing.dll => 0xf45985cf => 107
	i32 4100113165, ; 272: System.Private.Uri => 0xf462c30d => 120
	i32 4101842092, ; 273: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 44
	i32 4102112229, ; 274: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 275: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 276: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 47
	i32 4150914736, ; 277: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 278: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 77
	i32 4213026141, ; 279: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 103
	i32 4271975918, ; 280: Microsoft.Maui.Controls.dll => 0xfea12dee => 54
	i32 4274623895, ; 281: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 282: System.Runtime.Numerics => 0xfecef6ea => 125
	i32 4292120959 ; 283: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 77
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [284 x i32] [
	i32 115, ; 0
	i32 49, ; 1
	i32 132, ; 2
	i32 33, ; 3
	i32 58, ; 4
	i32 123, ; 5
	i32 97, ; 6
	i32 67, ; 7
	i32 85, ; 8
	i32 30, ; 9
	i32 31, ; 10
	i32 100, ; 11
	i32 2, ; 12
	i32 30, ; 13
	i32 63, ; 14
	i32 15, ; 15
	i32 74, ; 16
	i32 61, ; 17
	i32 14, ; 18
	i32 134, ; 19
	i32 132, ; 20
	i32 113, ; 21
	i32 34, ; 22
	i32 26, ; 23
	i32 96, ; 24
	i32 73, ; 25
	i32 136, ; 26
	i32 119, ; 27
	i32 13, ; 28
	i32 7, ; 29
	i32 53, ; 30
	i32 111, ; 31
	i32 50, ; 32
	i32 21, ; 33
	i32 35, ; 34
	i32 71, ; 35
	i32 19, ; 36
	i32 91, ; 37
	i32 129, ; 38
	i32 92, ; 39
	i32 1, ; 40
	i32 16, ; 41
	i32 4, ; 42
	i32 124, ; 43
	i32 59, ; 44
	i32 117, ; 45
	i32 109, ; 46
	i32 25, ; 47
	i32 52, ; 48
	i32 102, ; 49
	i32 120, ; 50
	i32 108, ; 51
	i32 98, ; 52
	i32 28, ; 53
	i32 74, ; 54
	i32 105, ; 55
	i32 96, ; 56
	i32 84, ; 57
	i32 107, ; 58
	i32 48, ; 59
	i32 3, ; 60
	i32 64, ; 61
	i32 106, ; 62
	i32 110, ; 63
	i32 76, ; 64
	i32 99, ; 65
	i32 89, ; 66
	i32 136, ; 67
	i32 16, ; 68
	i32 40, ; 69
	i32 22, ; 70
	i32 81, ; 71
	i32 40, ; 72
	i32 20, ; 73
	i32 44, ; 74
	i32 37, ; 75
	i32 18, ; 76
	i32 2, ; 77
	i32 60, ; 78
	i32 72, ; 79
	i32 112, ; 80
	i32 32, ; 81
	i32 84, ; 82
	i32 68, ; 83
	i32 126, ; 84
	i32 0, ; 85
	i32 6, ; 86
	i32 93, ; 87
	i32 109, ; 88
	i32 65, ; 89
	i32 53, ; 90
	i32 93, ; 91
	i32 108, ; 92
	i32 38, ; 93
	i32 10, ; 94
	i32 5, ; 95
	i32 131, ; 96
	i32 25, ; 97
	i32 78, ; 98
	i32 87, ; 99
	i32 36, ; 100
	i32 70, ; 101
	i32 114, ; 102
	i32 131, ; 103
	i32 127, ; 104
	i32 88, ; 105
	i32 116, ; 106
	i32 128, ; 107
	i32 38, ; 108
	i32 39, ; 109
	i32 61, ; 110
	i32 66, ; 111
	i32 23, ; 112
	i32 1, ; 113
	i32 134, ; 114
	i32 104, ; 115
	i32 85, ; 116
	i32 50, ; 117
	i32 140, ; 118
	i32 17, ; 119
	i32 73, ; 120
	i32 9, ; 121
	i32 78, ; 122
	i32 89, ; 123
	i32 88, ; 124
	i32 82, ; 125
	i32 126, ; 126
	i32 51, ; 127
	i32 29, ; 128
	i32 26, ; 129
	i32 110, ; 130
	i32 8, ; 131
	i32 42, ; 132
	i32 94, ; 133
	i32 45, ; 134
	i32 5, ; 135
	i32 42, ; 136
	i32 76, ; 137
	i32 0, ; 138
	i32 121, ; 139
	i32 75, ; 140
	i32 4, ; 141
	i32 104, ; 142
	i32 127, ; 143
	i32 118, ; 144
	i32 62, ; 145
	i32 101, ; 146
	i32 95, ; 147
	i32 56, ; 148
	i32 12, ; 149
	i32 52, ; 150
	i32 51, ; 151
	i32 119, ; 152
	i32 49, ; 153
	i32 90, ; 154
	i32 114, ; 155
	i32 14, ; 156
	i32 39, ; 157
	i32 46, ; 158
	i32 8, ; 159
	i32 83, ; 160
	i32 18, ; 161
	i32 138, ; 162
	i32 122, ; 163
	i32 116, ; 164
	i32 135, ; 165
	i32 45, ; 166
	i32 91, ; 167
	i32 13, ; 168
	i32 10, ; 169
	i32 101, ; 170
	i32 59, ; 171
	i32 137, ; 172
	i32 139, ; 173
	i32 54, ; 174
	i32 11, ; 175
	i32 129, ; 176
	i32 20, ; 177
	i32 90, ; 178
	i32 121, ; 179
	i32 70, ; 180
	i32 15, ; 181
	i32 41, ; 182
	i32 124, ; 183
	i32 106, ; 184
	i32 102, ; 185
	i32 125, ; 186
	i32 63, ; 187
	i32 65, ; 188
	i32 21, ; 189
	i32 55, ; 190
	i32 56, ; 191
	i32 86, ; 192
	i32 27, ; 193
	i32 58, ; 194
	i32 6, ; 195
	i32 68, ; 196
	i32 19, ; 197
	i32 41, ; 198
	i32 86, ; 199
	i32 57, ; 200
	i32 36, ; 201
	i32 138, ; 202
	i32 87, ; 203
	i32 118, ; 204
	i32 100, ; 205
	i32 72, ; 206
	i32 34, ; 207
	i32 79, ; 208
	i32 140, ; 209
	i32 98, ; 210
	i32 43, ; 211
	i32 12, ; 212
	i32 105, ; 213
	i32 80, ; 214
	i32 43, ; 215
	i32 133, ; 216
	i32 66, ; 217
	i32 111, ; 218
	i32 97, ; 219
	i32 7, ; 220
	i32 117, ; 221
	i32 71, ; 222
	i32 81, ; 223
	i32 24, ; 224
	i32 130, ; 225
	i32 60, ; 226
	i32 69, ; 227
	i32 139, ; 228
	i32 83, ; 229
	i32 3, ; 230
	i32 47, ; 231
	i32 137, ; 232
	i32 11, ; 233
	i32 99, ; 234
	i32 141, ; 235
	i32 24, ; 236
	i32 23, ; 237
	i32 130, ; 238
	i32 31, ; 239
	i32 112, ; 240
	i32 122, ; 241
	i32 75, ; 242
	i32 28, ; 243
	i32 80, ; 244
	i32 46, ; 245
	i32 115, ; 246
	i32 141, ; 247
	i32 33, ; 248
	i32 79, ; 249
	i32 103, ; 250
	i32 62, ; 251
	i32 67, ; 252
	i32 94, ; 253
	i32 95, ; 254
	i32 35, ; 255
	i32 128, ; 256
	i32 48, ; 257
	i32 123, ; 258
	i32 32, ; 259
	i32 92, ; 260
	i32 69, ; 261
	i32 135, ; 262
	i32 82, ; 263
	i32 64, ; 264
	i32 27, ; 265
	i32 9, ; 266
	i32 113, ; 267
	i32 55, ; 268
	i32 133, ; 269
	i32 57, ; 270
	i32 107, ; 271
	i32 120, ; 272
	i32 44, ; 273
	i32 22, ; 274
	i32 17, ; 275
	i32 47, ; 276
	i32 29, ; 277
	i32 77, ; 278
	i32 103, ; 279
	i32 54, ; 280
	i32 37, ; 281
	i32 125, ; 282
	i32 77 ; 283
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
