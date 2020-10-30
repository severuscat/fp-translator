{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
module Parser where
import GHC.Generics
import Lexer
import Control.DeepSeq
import Data.Char
import Grammar as G
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22
	= HappyTerminal (Lexer.Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x40\x07\x18\x00\x41\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\xc0\x00\x20\xc0\x0f\x00\x00\x00\x06\x00\x01\x7e\x00\x00\x00\x30\x00\x08\xf0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x02\xfc\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x03\x80\x00\x3f\x00\x00\x00\x18\x00\x24\xf8\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\xc9\x03\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x08\xf0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x80\x0e\x30\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x20\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x30\x00\x48\xf0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\xfc\x00\x00\x00\x60\x00\x00\xe0\x07\x00\x00\x00\x03\x00\x00\x3f\x00\x00\x00\x18\x00\x00\xf8\x01\x00\x00\xc0\x00\x00\xc0\x0f\x00\x00\x00\x06\x00\x00\x7e\x00\x00\x00\x30\x00\x00\xf0\x03\x00\x00\x80\x01\x00\x80\x1f\x00\x00\x00\x0c\x00\x00\xfc\x00\x00\x00\x60\x00\x10\xe0\x07\x00\x00\x00\x03\x80\x00\x3f\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x01\x40\x80\x1f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\xe8\x00\x03\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x01\x40\x80\x1f\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTokens","input","statements","statement","simple_stmt","compound_stmt","assignment","if_stmt","while_stmt","return_stmt","function_def","expression","disjunction","conjunction","inversion","comparison","sum","term","atom","block","\"def\"","\":\"","\"return\"","\"while\"","\"if\"","\"else:\"","\"True\"","\"False\"","\"+\"","\"-\"","\"/\"","\"*\"","\"==\"","\"pass\"","\"print\"","\">\"","\"<\"","\">=\"","\"<=\"","\"and\"","\"or\"","\"not\"","\"=\"","\"(\"","\")\"","\",\"","NEWLINE","INDENT","DEDENT","str","float","int","name","\"input()\"","\"int(input())\"","\"float(input())\"","%eof"]
        bit_start = st * 59
        bit_end = (st + 1) * 59
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..58]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (23#) = happyShift action_13
action_0 (25#) = happyShift action_14
action_0 (26#) = happyShift action_15
action_0 (27#) = happyShift action_16
action_0 (36#) = happyShift action_17
action_0 (37#) = happyShift action_18
action_0 (49#) = happyShift action_2
action_0 (55#) = happyShift action_19
action_0 (4#) = happyGoto action_3
action_0 (5#) = happyGoto action_4
action_0 (6#) = happyGoto action_5
action_0 (7#) = happyGoto action_6
action_0 (8#) = happyGoto action_7
action_0 (9#) = happyGoto action_8
action_0 (10#) = happyGoto action_9
action_0 (11#) = happyGoto action_10
action_0 (12#) = happyGoto action_11
action_0 (13#) = happyGoto action_12
action_0 x = happyTcHack x happyFail (happyExpListPerState 0)

action_1 (49#) = happyShift action_2
action_1 x = happyTcHack x happyFail (happyExpListPerState 1)

action_2 x = happyTcHack x happyReduce_1

action_3 (59#) = happyAccept
action_3 x = happyTcHack x happyFail (happyExpListPerState 3)

action_4 x = happyTcHack x happyReduce_2

action_5 (49#) = happyShift action_43
action_5 x = happyTcHack x happyReduce_3

action_6 x = happyTcHack x happyReduce_6

action_7 x = happyTcHack x happyReduce_5

action_8 x = happyTcHack x happyReduce_7

action_9 x = happyTcHack x happyReduce_15

action_10 x = happyTcHack x happyReduce_16

action_11 x = happyTcHack x happyReduce_10

action_12 x = happyTcHack x happyReduce_14

action_13 (55#) = happyShift action_42
action_13 x = happyTcHack x happyFail (happyExpListPerState 13)

action_14 (29#) = happyShift action_30
action_14 (30#) = happyShift action_31
action_14 (44#) = happyShift action_32
action_14 (53#) = happyShift action_33
action_14 (54#) = happyShift action_34
action_14 (55#) = happyShift action_35
action_14 (56#) = happyShift action_36
action_14 (57#) = happyShift action_37
action_14 (58#) = happyShift action_38
action_14 (14#) = happyGoto action_41
action_14 (15#) = happyGoto action_23
action_14 (16#) = happyGoto action_24
action_14 (17#) = happyGoto action_25
action_14 (18#) = happyGoto action_26
action_14 (19#) = happyGoto action_27
action_14 (20#) = happyGoto action_28
action_14 (21#) = happyGoto action_29
action_14 x = happyTcHack x happyFail (happyExpListPerState 14)

action_15 (29#) = happyShift action_30
action_15 (30#) = happyShift action_31
action_15 (44#) = happyShift action_32
action_15 (53#) = happyShift action_33
action_15 (54#) = happyShift action_34
action_15 (55#) = happyShift action_35
action_15 (56#) = happyShift action_36
action_15 (57#) = happyShift action_37
action_15 (58#) = happyShift action_38
action_15 (14#) = happyGoto action_40
action_15 (15#) = happyGoto action_23
action_15 (16#) = happyGoto action_24
action_15 (17#) = happyGoto action_25
action_15 (18#) = happyGoto action_26
action_15 (19#) = happyGoto action_27
action_15 (20#) = happyGoto action_28
action_15 (21#) = happyGoto action_29
action_15 x = happyTcHack x happyFail (happyExpListPerState 15)

action_16 (29#) = happyShift action_30
action_16 (30#) = happyShift action_31
action_16 (44#) = happyShift action_32
action_16 (53#) = happyShift action_33
action_16 (54#) = happyShift action_34
action_16 (55#) = happyShift action_35
action_16 (56#) = happyShift action_36
action_16 (57#) = happyShift action_37
action_16 (58#) = happyShift action_38
action_16 (14#) = happyGoto action_39
action_16 (15#) = happyGoto action_23
action_16 (16#) = happyGoto action_24
action_16 (17#) = happyGoto action_25
action_16 (18#) = happyGoto action_26
action_16 (19#) = happyGoto action_27
action_16 (20#) = happyGoto action_28
action_16 (21#) = happyGoto action_29
action_16 x = happyTcHack x happyFail (happyExpListPerState 16)

action_17 x = happyTcHack x happyReduce_8

action_18 (29#) = happyShift action_30
action_18 (30#) = happyShift action_31
action_18 (44#) = happyShift action_32
action_18 (53#) = happyShift action_33
action_18 (54#) = happyShift action_34
action_18 (55#) = happyShift action_35
action_18 (56#) = happyShift action_36
action_18 (57#) = happyShift action_37
action_18 (58#) = happyShift action_38
action_18 (14#) = happyGoto action_22
action_18 (15#) = happyGoto action_23
action_18 (16#) = happyGoto action_24
action_18 (17#) = happyGoto action_25
action_18 (18#) = happyGoto action_26
action_18 (19#) = happyGoto action_27
action_18 (20#) = happyGoto action_28
action_18 (21#) = happyGoto action_29
action_18 x = happyTcHack x happyFail (happyExpListPerState 18)

action_19 (45#) = happyShift action_20
action_19 (46#) = happyShift action_21
action_19 x = happyTcHack x happyFail (happyExpListPerState 19)

action_20 (29#) = happyShift action_30
action_20 (30#) = happyShift action_31
action_20 (44#) = happyShift action_32
action_20 (53#) = happyShift action_33
action_20 (54#) = happyShift action_34
action_20 (55#) = happyShift action_35
action_20 (56#) = happyShift action_36
action_20 (57#) = happyShift action_37
action_20 (58#) = happyShift action_38
action_20 (14#) = happyGoto action_63
action_20 (15#) = happyGoto action_23
action_20 (16#) = happyGoto action_24
action_20 (17#) = happyGoto action_25
action_20 (18#) = happyGoto action_26
action_20 (19#) = happyGoto action_27
action_20 (20#) = happyGoto action_28
action_20 (21#) = happyGoto action_29
action_20 x = happyTcHack x happyFail (happyExpListPerState 20)

action_21 (29#) = happyShift action_30
action_21 (30#) = happyShift action_31
action_21 (44#) = happyShift action_32
action_21 (47#) = happyShift action_62
action_21 (53#) = happyShift action_33
action_21 (54#) = happyShift action_34
action_21 (55#) = happyShift action_35
action_21 (56#) = happyShift action_36
action_21 (57#) = happyShift action_37
action_21 (58#) = happyShift action_38
action_21 (14#) = happyGoto action_61
action_21 (15#) = happyGoto action_23
action_21 (16#) = happyGoto action_24
action_21 (17#) = happyGoto action_25
action_21 (18#) = happyGoto action_26
action_21 (19#) = happyGoto action_27
action_21 (20#) = happyGoto action_28
action_21 (21#) = happyGoto action_29
action_21 x = happyTcHack x happyFail (happyExpListPerState 21)

action_22 x = happyTcHack x happyReduce_9

action_23 x = happyTcHack x happyReduce_24

action_24 (43#) = happyShift action_60
action_24 x = happyTcHack x happyReduce_26

action_25 (42#) = happyShift action_59
action_25 x = happyTcHack x happyReduce_28

action_26 x = happyTcHack x happyReduce_30

action_27 (31#) = happyShift action_52
action_27 (32#) = happyShift action_53
action_27 (35#) = happyShift action_54
action_27 (38#) = happyShift action_55
action_27 (39#) = happyShift action_56
action_27 (40#) = happyShift action_57
action_27 (41#) = happyShift action_58
action_27 x = happyTcHack x happyReduce_36

action_28 (33#) = happyShift action_50
action_28 (34#) = happyShift action_51
action_28 x = happyTcHack x happyReduce_39

action_29 x = happyTcHack x happyReduce_42

action_30 x = happyTcHack x happyReduce_50

action_31 x = happyTcHack x happyReduce_51

action_32 (29#) = happyShift action_30
action_32 (30#) = happyShift action_31
action_32 (44#) = happyShift action_32
action_32 (53#) = happyShift action_33
action_32 (54#) = happyShift action_34
action_32 (55#) = happyShift action_35
action_32 (56#) = happyShift action_36
action_32 (57#) = happyShift action_37
action_32 (58#) = happyShift action_38
action_32 (17#) = happyGoto action_49
action_32 (18#) = happyGoto action_26
action_32 (19#) = happyGoto action_27
action_32 (20#) = happyGoto action_28
action_32 (21#) = happyGoto action_29
action_32 x = happyTcHack x happyFail (happyExpListPerState 32)

action_33 x = happyTcHack x happyReduce_53

action_34 x = happyTcHack x happyReduce_52

action_35 (46#) = happyShift action_48
action_35 x = happyTcHack x happyReduce_46

action_36 x = happyTcHack x happyReduce_45

action_37 x = happyTcHack x happyReduce_43

action_38 x = happyTcHack x happyReduce_44

action_39 (24#) = happyShift action_47
action_39 x = happyTcHack x happyFail (happyExpListPerState 39)

action_40 (24#) = happyShift action_46
action_40 x = happyTcHack x happyFail (happyExpListPerState 40)

action_41 x = happyTcHack x happyReduce_20

action_42 (46#) = happyShift action_45
action_42 x = happyTcHack x happyFail (happyExpListPerState 42)

action_43 (23#) = happyShift action_13
action_43 (25#) = happyShift action_14
action_43 (26#) = happyShift action_15
action_43 (27#) = happyShift action_16
action_43 (36#) = happyShift action_17
action_43 (37#) = happyShift action_18
action_43 (55#) = happyShift action_19
action_43 (5#) = happyGoto action_44
action_43 (6#) = happyGoto action_5
action_43 (7#) = happyGoto action_6
action_43 (8#) = happyGoto action_7
action_43 (9#) = happyGoto action_8
action_43 (10#) = happyGoto action_9
action_43 (11#) = happyGoto action_10
action_43 (12#) = happyGoto action_11
action_43 (13#) = happyGoto action_12
action_43 x = happyTcHack x happyFail (happyExpListPerState 43)

action_44 x = happyTcHack x happyReduce_4

action_45 (47#) = happyShift action_82
action_45 (55#) = happyShift action_83
action_45 x = happyTcHack x happyFail (happyExpListPerState 45)

action_46 (49#) = happyShift action_80
action_46 (22#) = happyGoto action_81
action_46 x = happyTcHack x happyFail (happyExpListPerState 46)

action_47 (49#) = happyShift action_80
action_47 (22#) = happyGoto action_79
action_47 x = happyTcHack x happyFail (happyExpListPerState 47)

action_48 (29#) = happyShift action_30
action_48 (30#) = happyShift action_31
action_48 (44#) = happyShift action_32
action_48 (47#) = happyShift action_78
action_48 (53#) = happyShift action_33
action_48 (54#) = happyShift action_34
action_48 (55#) = happyShift action_35
action_48 (56#) = happyShift action_36
action_48 (57#) = happyShift action_37
action_48 (58#) = happyShift action_38
action_48 (14#) = happyGoto action_77
action_48 (15#) = happyGoto action_23
action_48 (16#) = happyGoto action_24
action_48 (17#) = happyGoto action_25
action_48 (18#) = happyGoto action_26
action_48 (19#) = happyGoto action_27
action_48 (20#) = happyGoto action_28
action_48 (21#) = happyGoto action_29
action_48 x = happyTcHack x happyFail (happyExpListPerState 48)

action_49 x = happyTcHack x happyReduce_29

action_50 (29#) = happyShift action_30
action_50 (30#) = happyShift action_31
action_50 (53#) = happyShift action_33
action_50 (54#) = happyShift action_34
action_50 (55#) = happyShift action_35
action_50 (56#) = happyShift action_36
action_50 (57#) = happyShift action_37
action_50 (58#) = happyShift action_38
action_50 (21#) = happyGoto action_76
action_50 x = happyTcHack x happyFail (happyExpListPerState 50)

action_51 (29#) = happyShift action_30
action_51 (30#) = happyShift action_31
action_51 (53#) = happyShift action_33
action_51 (54#) = happyShift action_34
action_51 (55#) = happyShift action_35
action_51 (56#) = happyShift action_36
action_51 (57#) = happyShift action_37
action_51 (58#) = happyShift action_38
action_51 (21#) = happyGoto action_75
action_51 x = happyTcHack x happyFail (happyExpListPerState 51)

action_52 (29#) = happyShift action_30
action_52 (30#) = happyShift action_31
action_52 (53#) = happyShift action_33
action_52 (54#) = happyShift action_34
action_52 (55#) = happyShift action_35
action_52 (56#) = happyShift action_36
action_52 (57#) = happyShift action_37
action_52 (58#) = happyShift action_38
action_52 (20#) = happyGoto action_74
action_52 (21#) = happyGoto action_29
action_52 x = happyTcHack x happyFail (happyExpListPerState 52)

action_53 (29#) = happyShift action_30
action_53 (30#) = happyShift action_31
action_53 (53#) = happyShift action_33
action_53 (54#) = happyShift action_34
action_53 (55#) = happyShift action_35
action_53 (56#) = happyShift action_36
action_53 (57#) = happyShift action_37
action_53 (58#) = happyShift action_38
action_53 (20#) = happyGoto action_73
action_53 (21#) = happyGoto action_29
action_53 x = happyTcHack x happyFail (happyExpListPerState 53)

action_54 (29#) = happyShift action_30
action_54 (30#) = happyShift action_31
action_54 (53#) = happyShift action_33
action_54 (54#) = happyShift action_34
action_54 (55#) = happyShift action_35
action_54 (56#) = happyShift action_36
action_54 (57#) = happyShift action_37
action_54 (58#) = happyShift action_38
action_54 (19#) = happyGoto action_72
action_54 (20#) = happyGoto action_28
action_54 (21#) = happyGoto action_29
action_54 x = happyTcHack x happyFail (happyExpListPerState 54)

action_55 (29#) = happyShift action_30
action_55 (30#) = happyShift action_31
action_55 (53#) = happyShift action_33
action_55 (54#) = happyShift action_34
action_55 (55#) = happyShift action_35
action_55 (56#) = happyShift action_36
action_55 (57#) = happyShift action_37
action_55 (58#) = happyShift action_38
action_55 (19#) = happyGoto action_71
action_55 (20#) = happyGoto action_28
action_55 (21#) = happyGoto action_29
action_55 x = happyTcHack x happyFail (happyExpListPerState 55)

action_56 (29#) = happyShift action_30
action_56 (30#) = happyShift action_31
action_56 (53#) = happyShift action_33
action_56 (54#) = happyShift action_34
action_56 (55#) = happyShift action_35
action_56 (56#) = happyShift action_36
action_56 (57#) = happyShift action_37
action_56 (58#) = happyShift action_38
action_56 (19#) = happyGoto action_70
action_56 (20#) = happyGoto action_28
action_56 (21#) = happyGoto action_29
action_56 x = happyTcHack x happyFail (happyExpListPerState 56)

action_57 (29#) = happyShift action_30
action_57 (30#) = happyShift action_31
action_57 (53#) = happyShift action_33
action_57 (54#) = happyShift action_34
action_57 (55#) = happyShift action_35
action_57 (56#) = happyShift action_36
action_57 (57#) = happyShift action_37
action_57 (58#) = happyShift action_38
action_57 (19#) = happyGoto action_69
action_57 (20#) = happyGoto action_28
action_57 (21#) = happyGoto action_29
action_57 x = happyTcHack x happyFail (happyExpListPerState 57)

action_58 (29#) = happyShift action_30
action_58 (30#) = happyShift action_31
action_58 (53#) = happyShift action_33
action_58 (54#) = happyShift action_34
action_58 (55#) = happyShift action_35
action_58 (56#) = happyShift action_36
action_58 (57#) = happyShift action_37
action_58 (58#) = happyShift action_38
action_58 (19#) = happyGoto action_68
action_58 (20#) = happyGoto action_28
action_58 (21#) = happyGoto action_29
action_58 x = happyTcHack x happyFail (happyExpListPerState 58)

action_59 (29#) = happyShift action_30
action_59 (30#) = happyShift action_31
action_59 (44#) = happyShift action_32
action_59 (53#) = happyShift action_33
action_59 (54#) = happyShift action_34
action_59 (55#) = happyShift action_35
action_59 (56#) = happyShift action_36
action_59 (57#) = happyShift action_37
action_59 (58#) = happyShift action_38
action_59 (17#) = happyGoto action_67
action_59 (18#) = happyGoto action_26
action_59 (19#) = happyGoto action_27
action_59 (20#) = happyGoto action_28
action_59 (21#) = happyGoto action_29
action_59 x = happyTcHack x happyFail (happyExpListPerState 59)

action_60 (29#) = happyShift action_30
action_60 (30#) = happyShift action_31
action_60 (44#) = happyShift action_32
action_60 (53#) = happyShift action_33
action_60 (54#) = happyShift action_34
action_60 (55#) = happyShift action_35
action_60 (56#) = happyShift action_36
action_60 (57#) = happyShift action_37
action_60 (58#) = happyShift action_38
action_60 (16#) = happyGoto action_66
action_60 (17#) = happyGoto action_25
action_60 (18#) = happyGoto action_26
action_60 (19#) = happyGoto action_27
action_60 (20#) = happyGoto action_28
action_60 (21#) = happyGoto action_29
action_60 x = happyTcHack x happyFail (happyExpListPerState 60)

action_61 (47#) = happyShift action_64
action_61 (48#) = happyShift action_65
action_61 x = happyTcHack x happyFail (happyExpListPerState 61)

action_62 x = happyTcHack x happyReduce_11

action_63 x = happyTcHack x happyReduce_17

action_64 x = happyTcHack x happyReduce_12

action_65 (29#) = happyShift action_30
action_65 (30#) = happyShift action_31
action_65 (44#) = happyShift action_32
action_65 (53#) = happyShift action_33
action_65 (54#) = happyShift action_34
action_65 (55#) = happyShift action_35
action_65 (56#) = happyShift action_36
action_65 (57#) = happyShift action_37
action_65 (58#) = happyShift action_38
action_65 (14#) = happyGoto action_90
action_65 (15#) = happyGoto action_23
action_65 (16#) = happyGoto action_24
action_65 (17#) = happyGoto action_25
action_65 (18#) = happyGoto action_26
action_65 (19#) = happyGoto action_27
action_65 (20#) = happyGoto action_28
action_65 (21#) = happyGoto action_29
action_65 x = happyTcHack x happyFail (happyExpListPerState 65)

action_66 x = happyTcHack x happyReduce_25

action_67 x = happyTcHack x happyReduce_27

action_68 (31#) = happyShift action_52
action_68 (32#) = happyShift action_53
action_68 x = happyTcHack x happyReduce_32

action_69 (31#) = happyShift action_52
action_69 (32#) = happyShift action_53
action_69 x = happyTcHack x happyReduce_34

action_70 (31#) = happyShift action_52
action_70 (32#) = happyShift action_53
action_70 x = happyTcHack x happyReduce_33

action_71 (31#) = happyShift action_52
action_71 (32#) = happyShift action_53
action_71 x = happyTcHack x happyReduce_35

action_72 (31#) = happyShift action_52
action_72 (32#) = happyShift action_53
action_72 x = happyTcHack x happyReduce_31

action_73 (33#) = happyShift action_50
action_73 (34#) = happyShift action_51
action_73 x = happyTcHack x happyReduce_38

action_74 (33#) = happyShift action_50
action_74 (34#) = happyShift action_51
action_74 x = happyTcHack x happyReduce_37

action_75 x = happyTcHack x happyReduce_40

action_76 x = happyTcHack x happyReduce_41

action_77 (47#) = happyShift action_88
action_77 (48#) = happyShift action_89
action_77 x = happyTcHack x happyFail (happyExpListPerState 77)

action_78 x = happyTcHack x happyReduce_47

action_79 x = happyTcHack x happyReduce_18

action_80 (50#) = happyShift action_87
action_80 x = happyTcHack x happyFail (happyExpListPerState 80)

action_81 x = happyTcHack x happyReduce_19

action_82 (24#) = happyShift action_86
action_82 x = happyTcHack x happyFail (happyExpListPerState 82)

action_83 (47#) = happyShift action_84
action_83 (48#) = happyShift action_85
action_83 x = happyTcHack x happyFail (happyExpListPerState 83)

action_84 (24#) = happyShift action_96
action_84 x = happyTcHack x happyFail (happyExpListPerState 84)

action_85 (55#) = happyShift action_95
action_85 x = happyTcHack x happyFail (happyExpListPerState 85)

action_86 (49#) = happyShift action_80
action_86 (22#) = happyGoto action_94
action_86 x = happyTcHack x happyFail (happyExpListPerState 86)

action_87 (23#) = happyShift action_13
action_87 (25#) = happyShift action_14
action_87 (26#) = happyShift action_15
action_87 (27#) = happyShift action_16
action_87 (36#) = happyShift action_17
action_87 (37#) = happyShift action_18
action_87 (55#) = happyShift action_19
action_87 (5#) = happyGoto action_93
action_87 (6#) = happyGoto action_5
action_87 (7#) = happyGoto action_6
action_87 (8#) = happyGoto action_7
action_87 (9#) = happyGoto action_8
action_87 (10#) = happyGoto action_9
action_87 (11#) = happyGoto action_10
action_87 (12#) = happyGoto action_11
action_87 (13#) = happyGoto action_12
action_87 x = happyTcHack x happyFail (happyExpListPerState 87)

action_88 x = happyTcHack x happyReduce_48

action_89 (29#) = happyShift action_30
action_89 (30#) = happyShift action_31
action_89 (44#) = happyShift action_32
action_89 (53#) = happyShift action_33
action_89 (54#) = happyShift action_34
action_89 (55#) = happyShift action_35
action_89 (56#) = happyShift action_36
action_89 (57#) = happyShift action_37
action_89 (58#) = happyShift action_38
action_89 (14#) = happyGoto action_92
action_89 (15#) = happyGoto action_23
action_89 (16#) = happyGoto action_24
action_89 (17#) = happyGoto action_25
action_89 (18#) = happyGoto action_26
action_89 (19#) = happyGoto action_27
action_89 (20#) = happyGoto action_28
action_89 (21#) = happyGoto action_29
action_89 x = happyTcHack x happyFail (happyExpListPerState 89)

action_90 (47#) = happyShift action_91
action_90 x = happyTcHack x happyFail (happyExpListPerState 90)

action_91 x = happyTcHack x happyReduce_13

action_92 (47#) = happyShift action_100
action_92 x = happyTcHack x happyFail (happyExpListPerState 92)

action_93 (51#) = happyShift action_99
action_93 x = happyTcHack x happyFail (happyExpListPerState 93)

action_94 x = happyTcHack x happyReduce_21

action_95 (47#) = happyShift action_98
action_95 x = happyTcHack x happyFail (happyExpListPerState 95)

action_96 (49#) = happyShift action_80
action_96 (22#) = happyGoto action_97
action_96 x = happyTcHack x happyFail (happyExpListPerState 96)

action_97 x = happyTcHack x happyReduce_22

action_98 (24#) = happyShift action_101
action_98 x = happyTcHack x happyFail (happyExpListPerState 98)

action_99 x = happyTcHack x happyReduce_54

action_100 x = happyTcHack x happyReduce_49

action_101 (49#) = happyShift action_80
action_101 (22#) = happyGoto action_102
action_101 x = happyTcHack x happyFail (happyExpListPerState 101)

action_102 x = happyTcHack x happyReduce_23

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_1  4# happyReduction_1
happyReduction_1 _
	 =  HappyAbsSyn4
		 ([G.Pass]
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_1  4# happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_1  5# happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_3 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_3  5# happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happySpecReduce_1  6# happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happySpecReduce_1  6# happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happySpecReduce_1  7# happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_1  7# happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn7
		 (G.Pass
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_2  7# happyReduction_9
happyReduction_9 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (G.Print happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_1  7# happyReduction_10
happyReduction_10 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_3  7# happyReduction_11
happyReduction_11 _
	_
	(HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn7
		 (F0CallS happy_var_1
	)
happyReduction_11 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happyReduce 4# 7# happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (F1CallS happy_var_1 happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happyReduce 6# 7# happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (F2CallS happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_1  8# happyReduction_14
happyReduction_14 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_1  8# happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_1  8# happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happySpecReduce_3  9# happyReduction_17
happyReduction_17 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn9
		 (G.Assignment happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happyReduce 4# 10# happyReduction_18
happyReduction_18 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (G.If happy_var_2 happy_var_4
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happyReduce 4# 11# happyReduction_19
happyReduction_19 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (G.While happy_var_2 happy_var_4
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_2  12# happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (G.Return happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happyReduce 6# 13# happyReduction_21
happyReduction_21 ((HappyAbsSyn22  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (G.Func0Def happy_var_2 happy_var_6
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happyReduce 7# 13# happyReduction_22
happyReduction_22 ((HappyAbsSyn22  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (G.Func1Def happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_23 = happyReduce 9# 13# happyReduction_23
happyReduction_23 ((HappyAbsSyn22  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_6)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (G.Func2Def happy_var_2 happy_var_4 happy_var_6 happy_var_9
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_24 = happySpecReduce_1  14# happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_25 = happySpecReduce_3  15# happyReduction_25
happyReduction_25 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (G.Or happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_26 = happySpecReduce_1  15# happyReduction_26
happyReduction_26 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_27 = happySpecReduce_3  16# happyReduction_27
happyReduction_27 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (G.And happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_28 = happySpecReduce_1  16# happyReduction_28
happyReduction_28 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_29 = happySpecReduce_2  17# happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (G.Not happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_30 = happySpecReduce_1  17# happyReduction_30
happyReduction_30 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_31 = happySpecReduce_3  18# happyReduction_31
happyReduction_31 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (G.Eq happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_32 = happySpecReduce_3  18# happyReduction_32
happyReduction_32 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (G.LessThanEq happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_33 = happySpecReduce_3  18# happyReduction_33
happyReduction_33 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (G.LessThan happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_34 = happySpecReduce_3  18# happyReduction_34
happyReduction_34 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (G.GreaterThanEq happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_35 = happySpecReduce_3  18# happyReduction_35
happyReduction_35 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (G.GreaterThan happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_36 = happySpecReduce_1  18# happyReduction_36
happyReduction_36 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_37 = happySpecReduce_3  19# happyReduction_37
happyReduction_37 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (G.Add happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_38 = happySpecReduce_3  19# happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (G.Sub happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_39 = happySpecReduce_1  19# happyReduction_39
happyReduction_39 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_40 = happySpecReduce_3  20# happyReduction_40
happyReduction_40 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (G.Mul happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_41 = happySpecReduce_3  20# happyReduction_41
happyReduction_41 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (G.Div happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_42 = happySpecReduce_1  20# happyReduction_42
happyReduction_42 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_43 = happySpecReduce_1  21# happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn21
		 (G.ReadInt
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_44 = happySpecReduce_1  21# happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn21
		 (G.ReadFloat
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_45 = happySpecReduce_1  21# happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn21
		 (G.ReadStr
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_46 = happySpecReduce_1  21# happyReduction_46
happyReduction_46 (HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn21
		 (G.Var happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_47 = happySpecReduce_3  21# happyReduction_47
happyReduction_47 _
	_
	(HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn21
		 (G.F0CallE happy_var_1
	)
happyReduction_47 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_48 = happyReduce 4# 21# happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (G.F1CallE happy_var_1 happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_49 = happyReduce 6# 21# happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (G.F2CallE happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_50 = happySpecReduce_1  21# happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn21
		 (G.MyTrue
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_51 = happySpecReduce_1  21# happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn21
		 (G.MyFalse
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_52 = happySpecReduce_1  21# happyReduction_52
happyReduction_52 (HappyTerminal (Lexer.MyInt happy_var_1))
	 =  HappyAbsSyn21
		 (G.MyInt happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_53 = happySpecReduce_1  21# happyReduction_53
happyReduction_53 (HappyTerminal (Lexer.MyFloat happy_var_1))
	 =  HappyAbsSyn21
		 (G.MyFloat happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_54 = happyReduce 4# 22# happyReduction_54
happyReduction_54 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 59# 59# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Lexer.Def -> cont 23#;
	Lexer.Colon -> cont 24#;
	Lexer.ReturnStm -> cont 25#;
	Lexer.While -> cont 26#;
	Lexer.If -> cont 27#;
	Lexer.Else -> cont 28#;
	Lexer.TTrue -> cont 29#;
	Lexer.TFalse -> cont 30#;
	Lexer.Plus -> cont 31#;
	Lexer.Minus -> cont 32#;
	Lexer.Div -> cont 33#;
	Lexer.Mul -> cont 34#;
	Lexer.Equality -> cont 35#;
	Lexer.Pass -> cont 36#;
	Lexer.Print -> cont 37#;
	Lexer.Greater -> cont 38#;
	Lexer.Less -> cont 39#;
	Lexer.GreaterEq -> cont 40#;
	Lexer.LessEq -> cont 41#;
	Lexer.And -> cont 42#;
	Lexer.Or -> cont 43#;
	Lexer.Not -> cont 44#;
	Lexer.Assign -> cont 45#;
	Lexer.OPar -> cont 46#;
	Lexer.CPar -> cont 47#;
	Lexer.Comma -> cont 48#;
	Lexer.Newline -> cont 49#;
	Lexer.Indent -> cont 50#;
	Lexer.Dedent -> cont 51#;
	Lexer.Str happy_dollar_dollar -> cont 52#;
	Lexer.MyFloat happy_dollar_dollar -> cont 53#;
	Lexer.MyInt happy_dollar_dollar -> cont 54#;
	Lexer.Name happy_dollar_dollar -> cont 55#;
	Lexer.ReadStr -> cont 56#;
	Lexer.ReadInt -> cont 57#;
	Lexer.ReadFloat -> cont 58#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 59# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Lexer.Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseTokens tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError =  error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 9 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "/tmp/ghcfade_0/ghc_2.h" #-}




























































































































































{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 1#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 1# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j ) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}


indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Happy_GHC_Exts.Int# ->                    -- token number
         Happy_GHC_Exts.Int# ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 1# tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Happy_GHC_Exts.Int#
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n ((_):(t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (1# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 1# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  1# tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action 1# 1# tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action 1# 1# tk (HappyState (action)) sts ( (HappyErrorToken (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
