{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
module ParserOld where
import GHC.Generics
import Lexer1
import Control.DeepSeq
import Data.Char
import Lib as L
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30
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
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\xc0\x13\x00\x80\x04\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x03\x40\x00\x03\x00\x00\x00\xc0\x00\x10\xc0\x00\x00\x00\x00\x30\x00\x04\x30\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\xc0\x00\x10\xc0\x00\x00\x00\x00\x00\x00\x40\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe6\x03\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x04\x30\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x01\x00\x00\x00\x08\x01\x00\x48\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x0c\x00\x00\x00\x00\x03\x00\x00\x03\x00\x00\x00\xc0\x00\x00\xc0\x00\x00\x00\x00\x30\x00\x00\x30\x00\x00\x00\x00\x0c\x00\x00\x0c\x00\x00\x00\x00\x03\x00\x00\x03\x00\x00\x00\xc0\x00\x00\xc0\x00\x00\x00\x00\x30\x00\x00\x30\x00\x00\x00\x00\x0c\x00\x00\x0c\x00\x00\x00\x00\x03\x40\x00\x03\x00\x00\x00\xc0\x00\x10\xc0\x00\x00\x00\x00\x42\x00\x00\x12\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x14\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x80\x10\x00\x80\x04\x00\x00\x00\xf0\x04\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x01\x00\x48\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x08\x01\x00\x48\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x00\x00\x12\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTokens","input","statements","statement","simple_stmt","compound_stmt","function_call","f0call","f1call","f2call","assignment","if_stmt","else_block","while_stmt","return_stmt","function_def","function_def0","function_def1","function_def2","expression","disjunction","conjunction","inversion","comparison","sum","term","atom","block","\"def\"","\"return\"","\"while\"","\"if\"","\"True\"","\"False\"","\"pass\"","\"+\"","\"-\"","\"/\"","\"*\"","\"==\"","\">\"","\"<\"","\">=\"","\"<=\"","\"and\"","\"or\"","\"not\"","\"else\"","\"=\"","\"(\"","\")\"","\":\"","\",\"","NEWLINE","INDENT","DEDENT","name","literal","str","%eof"]
        bit_start = st * 62
        bit_end = (st + 1) * 62
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..61]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (31#) = happyShift action_20
action_0 (32#) = happyShift action_21
action_0 (33#) = happyShift action_22
action_0 (34#) = happyShift action_23
action_0 (37#) = happyShift action_24
action_0 (56#) = happyShift action_2
action_0 (59#) = happyShift action_25
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
action_0 (14#) = happyGoto action_13
action_0 (16#) = happyGoto action_14
action_0 (17#) = happyGoto action_15
action_0 (18#) = happyGoto action_16
action_0 (19#) = happyGoto action_17
action_0 (20#) = happyGoto action_18
action_0 (21#) = happyGoto action_19
action_0 x = happyTcHack x happyFail (happyExpListPerState 0)

action_1 (56#) = happyShift action_2
action_1 x = happyTcHack x happyFail (happyExpListPerState 1)

action_2 x = happyTcHack x happyReduce_1

action_3 (62#) = happyAccept
action_3 x = happyTcHack x happyFail (happyExpListPerState 3)

action_4 x = happyTcHack x happyReduce_2

action_5 (56#) = happyShift action_47
action_5 x = happyTcHack x happyReduce_3

action_6 x = happyTcHack x happyReduce_6

action_7 x = happyTcHack x happyReduce_5

action_8 x = happyTcHack x happyReduce_10

action_9 x = happyTcHack x happyReduce_14

action_10 x = happyTcHack x happyReduce_15

action_11 x = happyTcHack x happyReduce_16

action_12 (56#) = happyShift action_46
action_12 x = happyTcHack x happyFail (happyExpListPerState 12)

action_13 x = happyTcHack x happyReduce_12

action_14 x = happyTcHack x happyReduce_13

action_15 (56#) = happyShift action_45
action_15 x = happyTcHack x happyFail (happyExpListPerState 15)

action_16 x = happyTcHack x happyReduce_11

action_17 x = happyTcHack x happyReduce_26

action_18 x = happyTcHack x happyReduce_27

action_19 x = happyTcHack x happyReduce_28

action_20 (59#) = happyShift action_44
action_20 x = happyTcHack x happyFail (happyExpListPerState 20)

action_21 (35#) = happyShift action_37
action_21 (36#) = happyShift action_38
action_21 (49#) = happyShift action_39
action_21 (59#) = happyShift action_40
action_21 (60#) = happyShift action_41
action_21 (22#) = happyGoto action_43
action_21 (23#) = happyGoto action_30
action_21 (24#) = happyGoto action_31
action_21 (25#) = happyGoto action_32
action_21 (26#) = happyGoto action_33
action_21 (27#) = happyGoto action_34
action_21 (28#) = happyGoto action_35
action_21 (29#) = happyGoto action_36
action_21 x = happyTcHack x happyFail (happyExpListPerState 21)

action_22 (35#) = happyShift action_37
action_22 (36#) = happyShift action_38
action_22 (49#) = happyShift action_39
action_22 (59#) = happyShift action_40
action_22 (60#) = happyShift action_41
action_22 (22#) = happyGoto action_42
action_22 (23#) = happyGoto action_30
action_22 (24#) = happyGoto action_31
action_22 (25#) = happyGoto action_32
action_22 (26#) = happyGoto action_33
action_22 (27#) = happyGoto action_34
action_22 (28#) = happyGoto action_35
action_22 (29#) = happyGoto action_36
action_22 x = happyTcHack x happyFail (happyExpListPerState 22)

action_23 (35#) = happyShift action_37
action_23 (36#) = happyShift action_38
action_23 (49#) = happyShift action_39
action_23 (59#) = happyShift action_40
action_23 (60#) = happyShift action_41
action_23 (22#) = happyGoto action_29
action_23 (23#) = happyGoto action_30
action_23 (24#) = happyGoto action_31
action_23 (25#) = happyGoto action_32
action_23 (26#) = happyGoto action_33
action_23 (27#) = happyGoto action_34
action_23 (28#) = happyGoto action_35
action_23 (29#) = happyGoto action_36
action_23 x = happyTcHack x happyFail (happyExpListPerState 23)

action_24 (56#) = happyShift action_28
action_24 x = happyTcHack x happyFail (happyExpListPerState 24)

action_25 (51#) = happyShift action_26
action_25 (52#) = happyShift action_27
action_25 x = happyTcHack x happyFail (happyExpListPerState 25)

action_26 (35#) = happyShift action_37
action_26 (36#) = happyShift action_38
action_26 (49#) = happyShift action_39
action_26 (59#) = happyShift action_40
action_26 (60#) = happyShift action_41
action_26 (22#) = happyGoto action_66
action_26 (23#) = happyGoto action_30
action_26 (24#) = happyGoto action_31
action_26 (25#) = happyGoto action_32
action_26 (26#) = happyGoto action_33
action_26 (27#) = happyGoto action_34
action_26 (28#) = happyGoto action_35
action_26 (29#) = happyGoto action_36
action_26 x = happyTcHack x happyFail (happyExpListPerState 26)

action_27 (53#) = happyShift action_64
action_27 (59#) = happyShift action_65
action_27 x = happyTcHack x happyFail (happyExpListPerState 27)

action_28 x = happyTcHack x happyReduce_8

action_29 (54#) = happyShift action_63
action_29 x = happyTcHack x happyFail (happyExpListPerState 29)

action_30 x = happyTcHack x happyReduce_32

action_31 (48#) = happyShift action_62
action_31 x = happyTcHack x happyReduce_34

action_32 (47#) = happyShift action_61
action_32 x = happyTcHack x happyReduce_36

action_33 x = happyTcHack x happyReduce_38

action_34 (38#) = happyShift action_54
action_34 (39#) = happyShift action_55
action_34 (42#) = happyShift action_56
action_34 (43#) = happyShift action_57
action_34 (44#) = happyShift action_58
action_34 (45#) = happyShift action_59
action_34 (46#) = happyShift action_60
action_34 x = happyTcHack x happyReduce_44

action_35 (40#) = happyShift action_52
action_35 (41#) = happyShift action_53
action_35 x = happyTcHack x happyReduce_47

action_36 x = happyTcHack x happyReduce_50

action_37 x = happyTcHack x happyReduce_52

action_38 x = happyTcHack x happyReduce_53

action_39 (35#) = happyShift action_37
action_39 (36#) = happyShift action_38
action_39 (49#) = happyShift action_39
action_39 (59#) = happyShift action_40
action_39 (60#) = happyShift action_41
action_39 (25#) = happyGoto action_51
action_39 (26#) = happyGoto action_33
action_39 (27#) = happyGoto action_34
action_39 (28#) = happyGoto action_35
action_39 (29#) = happyGoto action_36
action_39 x = happyTcHack x happyFail (happyExpListPerState 39)

action_40 x = happyTcHack x happyReduce_51

action_41 x = happyTcHack x happyReduce_54

action_42 (54#) = happyShift action_50
action_42 x = happyTcHack x happyFail (happyExpListPerState 42)

action_43 x = happyTcHack x happyReduce_25

action_44 (52#) = happyShift action_49
action_44 x = happyTcHack x happyFail (happyExpListPerState 44)

action_45 x = happyTcHack x happyReduce_9

action_46 x = happyTcHack x happyReduce_7

action_47 (31#) = happyShift action_20
action_47 (32#) = happyShift action_21
action_47 (33#) = happyShift action_22
action_47 (34#) = happyShift action_23
action_47 (37#) = happyShift action_24
action_47 (59#) = happyShift action_25
action_47 (5#) = happyGoto action_48
action_47 (6#) = happyGoto action_5
action_47 (7#) = happyGoto action_6
action_47 (8#) = happyGoto action_7
action_47 (9#) = happyGoto action_8
action_47 (10#) = happyGoto action_9
action_47 (11#) = happyGoto action_10
action_47 (12#) = happyGoto action_11
action_47 (13#) = happyGoto action_12
action_47 (14#) = happyGoto action_13
action_47 (16#) = happyGoto action_14
action_47 (17#) = happyGoto action_15
action_47 (18#) = happyGoto action_16
action_47 (19#) = happyGoto action_17
action_47 (20#) = happyGoto action_18
action_47 (21#) = happyGoto action_19
action_47 x = happyTcHack x happyFail (happyExpListPerState 47)

action_48 x = happyTcHack x happyReduce_4

action_49 (53#) = happyShift action_84
action_49 (59#) = happyShift action_85
action_49 x = happyTcHack x happyFail (happyExpListPerState 49)

action_50 (32#) = happyShift action_21
action_50 (37#) = happyShift action_24
action_50 (56#) = happyShift action_71
action_50 (59#) = happyShift action_25
action_50 (7#) = happyGoto action_69
action_50 (9#) = happyGoto action_8
action_50 (10#) = happyGoto action_9
action_50 (11#) = happyGoto action_10
action_50 (12#) = happyGoto action_11
action_50 (13#) = happyGoto action_12
action_50 (17#) = happyGoto action_15
action_50 (30#) = happyGoto action_83
action_50 x = happyTcHack x happyFail (happyExpListPerState 50)

action_51 x = happyTcHack x happyReduce_37

action_52 (35#) = happyShift action_37
action_52 (36#) = happyShift action_38
action_52 (59#) = happyShift action_40
action_52 (60#) = happyShift action_41
action_52 (29#) = happyGoto action_82
action_52 x = happyTcHack x happyFail (happyExpListPerState 52)

action_53 (35#) = happyShift action_37
action_53 (36#) = happyShift action_38
action_53 (59#) = happyShift action_40
action_53 (60#) = happyShift action_41
action_53 (29#) = happyGoto action_81
action_53 x = happyTcHack x happyFail (happyExpListPerState 53)

action_54 (35#) = happyShift action_37
action_54 (36#) = happyShift action_38
action_54 (59#) = happyShift action_40
action_54 (60#) = happyShift action_41
action_54 (28#) = happyGoto action_80
action_54 (29#) = happyGoto action_36
action_54 x = happyTcHack x happyFail (happyExpListPerState 54)

action_55 (35#) = happyShift action_37
action_55 (36#) = happyShift action_38
action_55 (59#) = happyShift action_40
action_55 (60#) = happyShift action_41
action_55 (28#) = happyGoto action_79
action_55 (29#) = happyGoto action_36
action_55 x = happyTcHack x happyFail (happyExpListPerState 55)

action_56 (35#) = happyShift action_37
action_56 (36#) = happyShift action_38
action_56 (59#) = happyShift action_40
action_56 (60#) = happyShift action_41
action_56 (27#) = happyGoto action_78
action_56 (28#) = happyGoto action_35
action_56 (29#) = happyGoto action_36
action_56 x = happyTcHack x happyFail (happyExpListPerState 56)

action_57 (35#) = happyShift action_37
action_57 (36#) = happyShift action_38
action_57 (59#) = happyShift action_40
action_57 (60#) = happyShift action_41
action_57 (27#) = happyGoto action_77
action_57 (28#) = happyGoto action_35
action_57 (29#) = happyGoto action_36
action_57 x = happyTcHack x happyFail (happyExpListPerState 57)

action_58 (35#) = happyShift action_37
action_58 (36#) = happyShift action_38
action_58 (59#) = happyShift action_40
action_58 (60#) = happyShift action_41
action_58 (27#) = happyGoto action_76
action_58 (28#) = happyGoto action_35
action_58 (29#) = happyGoto action_36
action_58 x = happyTcHack x happyFail (happyExpListPerState 58)

action_59 (35#) = happyShift action_37
action_59 (36#) = happyShift action_38
action_59 (59#) = happyShift action_40
action_59 (60#) = happyShift action_41
action_59 (27#) = happyGoto action_75
action_59 (28#) = happyGoto action_35
action_59 (29#) = happyGoto action_36
action_59 x = happyTcHack x happyFail (happyExpListPerState 59)

action_60 (35#) = happyShift action_37
action_60 (36#) = happyShift action_38
action_60 (59#) = happyShift action_40
action_60 (60#) = happyShift action_41
action_60 (27#) = happyGoto action_74
action_60 (28#) = happyGoto action_35
action_60 (29#) = happyGoto action_36
action_60 x = happyTcHack x happyFail (happyExpListPerState 60)

action_61 (35#) = happyShift action_37
action_61 (36#) = happyShift action_38
action_61 (49#) = happyShift action_39
action_61 (59#) = happyShift action_40
action_61 (60#) = happyShift action_41
action_61 (25#) = happyGoto action_73
action_61 (26#) = happyGoto action_33
action_61 (27#) = happyGoto action_34
action_61 (28#) = happyGoto action_35
action_61 (29#) = happyGoto action_36
action_61 x = happyTcHack x happyFail (happyExpListPerState 61)

action_62 (35#) = happyShift action_37
action_62 (36#) = happyShift action_38
action_62 (49#) = happyShift action_39
action_62 (59#) = happyShift action_40
action_62 (60#) = happyShift action_41
action_62 (24#) = happyGoto action_72
action_62 (25#) = happyGoto action_32
action_62 (26#) = happyGoto action_33
action_62 (27#) = happyGoto action_34
action_62 (28#) = happyGoto action_35
action_62 (29#) = happyGoto action_36
action_62 x = happyTcHack x happyFail (happyExpListPerState 62)

action_63 (32#) = happyShift action_21
action_63 (37#) = happyShift action_24
action_63 (56#) = happyShift action_71
action_63 (59#) = happyShift action_25
action_63 (7#) = happyGoto action_69
action_63 (9#) = happyGoto action_8
action_63 (10#) = happyGoto action_9
action_63 (11#) = happyGoto action_10
action_63 (12#) = happyGoto action_11
action_63 (13#) = happyGoto action_12
action_63 (17#) = happyGoto action_15
action_63 (30#) = happyGoto action_70
action_63 x = happyTcHack x happyFail (happyExpListPerState 63)

action_64 x = happyTcHack x happyReduce_17

action_65 (53#) = happyShift action_67
action_65 (55#) = happyShift action_68
action_65 x = happyTcHack x happyFail (happyExpListPerState 65)

action_66 x = happyTcHack x happyReduce_20

action_67 x = happyTcHack x happyReduce_18

action_68 (59#) = happyShift action_92
action_68 x = happyTcHack x happyFail (happyExpListPerState 68)

action_69 x = happyTcHack x happyReduce_56

action_70 (50#) = happyShift action_91
action_70 (15#) = happyGoto action_90
action_70 x = happyTcHack x happyReduce_21

action_71 (57#) = happyShift action_89
action_71 x = happyTcHack x happyFail (happyExpListPerState 71)

action_72 x = happyTcHack x happyReduce_33

action_73 x = happyTcHack x happyReduce_35

action_74 (38#) = happyShift action_54
action_74 (39#) = happyShift action_55
action_74 x = happyTcHack x happyReduce_40

action_75 (38#) = happyShift action_54
action_75 (39#) = happyShift action_55
action_75 x = happyTcHack x happyReduce_42

action_76 (38#) = happyShift action_54
action_76 (39#) = happyShift action_55
action_76 x = happyTcHack x happyReduce_41

action_77 (38#) = happyShift action_54
action_77 (39#) = happyShift action_55
action_77 x = happyTcHack x happyReduce_43

action_78 (38#) = happyShift action_54
action_78 (39#) = happyShift action_55
action_78 x = happyTcHack x happyReduce_39

action_79 (40#) = happyShift action_52
action_79 (41#) = happyShift action_53
action_79 x = happyTcHack x happyReduce_46

action_80 (40#) = happyShift action_52
action_80 (41#) = happyShift action_53
action_80 x = happyTcHack x happyReduce_45

action_81 x = happyTcHack x happyReduce_48

action_82 x = happyTcHack x happyReduce_49

action_83 x = happyTcHack x happyReduce_24

action_84 (54#) = happyShift action_88
action_84 x = happyTcHack x happyFail (happyExpListPerState 84)

action_85 (53#) = happyShift action_86
action_85 (55#) = happyShift action_87
action_85 x = happyTcHack x happyFail (happyExpListPerState 85)

action_86 (54#) = happyShift action_98
action_86 x = happyTcHack x happyFail (happyExpListPerState 86)

action_87 (59#) = happyShift action_97
action_87 x = happyTcHack x happyFail (happyExpListPerState 87)

action_88 (32#) = happyShift action_21
action_88 (37#) = happyShift action_24
action_88 (56#) = happyShift action_71
action_88 (59#) = happyShift action_25
action_88 (7#) = happyGoto action_69
action_88 (9#) = happyGoto action_8
action_88 (10#) = happyGoto action_9
action_88 (11#) = happyGoto action_10
action_88 (12#) = happyGoto action_11
action_88 (13#) = happyGoto action_12
action_88 (17#) = happyGoto action_15
action_88 (30#) = happyGoto action_96
action_88 x = happyTcHack x happyFail (happyExpListPerState 88)

action_89 (31#) = happyShift action_20
action_89 (32#) = happyShift action_21
action_89 (33#) = happyShift action_22
action_89 (34#) = happyShift action_23
action_89 (37#) = happyShift action_24
action_89 (59#) = happyShift action_25
action_89 (5#) = happyGoto action_95
action_89 (6#) = happyGoto action_5
action_89 (7#) = happyGoto action_6
action_89 (8#) = happyGoto action_7
action_89 (9#) = happyGoto action_8
action_89 (10#) = happyGoto action_9
action_89 (11#) = happyGoto action_10
action_89 (12#) = happyGoto action_11
action_89 (13#) = happyGoto action_12
action_89 (14#) = happyGoto action_13
action_89 (16#) = happyGoto action_14
action_89 (17#) = happyGoto action_15
action_89 (18#) = happyGoto action_16
action_89 (19#) = happyGoto action_17
action_89 (20#) = happyGoto action_18
action_89 (21#) = happyGoto action_19
action_89 x = happyTcHack x happyFail (happyExpListPerState 89)

action_90 x = happyTcHack x happyReduce_22

action_91 (54#) = happyShift action_94
action_91 x = happyTcHack x happyFail (happyExpListPerState 91)

action_92 (53#) = happyShift action_93
action_92 x = happyTcHack x happyFail (happyExpListPerState 92)

action_93 x = happyTcHack x happyReduce_19

action_94 (32#) = happyShift action_21
action_94 (37#) = happyShift action_24
action_94 (56#) = happyShift action_71
action_94 (59#) = happyShift action_25
action_94 (7#) = happyGoto action_69
action_94 (9#) = happyGoto action_8
action_94 (10#) = happyGoto action_9
action_94 (11#) = happyGoto action_10
action_94 (12#) = happyGoto action_11
action_94 (13#) = happyGoto action_12
action_94 (17#) = happyGoto action_15
action_94 (30#) = happyGoto action_102
action_94 x = happyTcHack x happyFail (happyExpListPerState 94)

action_95 (58#) = happyShift action_101
action_95 x = happyTcHack x happyFail (happyExpListPerState 95)

action_96 x = happyTcHack x happyReduce_29

action_97 (53#) = happyShift action_100
action_97 x = happyTcHack x happyFail (happyExpListPerState 97)

action_98 (32#) = happyShift action_21
action_98 (37#) = happyShift action_24
action_98 (56#) = happyShift action_71
action_98 (59#) = happyShift action_25
action_98 (7#) = happyGoto action_69
action_98 (9#) = happyGoto action_8
action_98 (10#) = happyGoto action_9
action_98 (11#) = happyGoto action_10
action_98 (12#) = happyGoto action_11
action_98 (13#) = happyGoto action_12
action_98 (17#) = happyGoto action_15
action_98 (30#) = happyGoto action_99
action_98 x = happyTcHack x happyFail (happyExpListPerState 98)

action_99 x = happyTcHack x happyReduce_30

action_100 (54#) = happyShift action_103
action_100 x = happyTcHack x happyFail (happyExpListPerState 100)

action_101 x = happyTcHack x happyReduce_55

action_102 x = happyTcHack x happyReduce_23

action_103 (32#) = happyShift action_21
action_103 (37#) = happyShift action_24
action_103 (56#) = happyShift action_71
action_103 (59#) = happyShift action_25
action_103 (7#) = happyGoto action_69
action_103 (9#) = happyGoto action_8
action_103 (10#) = happyGoto action_9
action_103 (11#) = happyGoto action_10
action_103 (12#) = happyGoto action_11
action_103 (13#) = happyGoto action_12
action_103 (17#) = happyGoto action_15
action_103 (30#) = happyGoto action_104
action_103 x = happyTcHack x happyFail (happyExpListPerState 103)

action_104 x = happyTcHack x happyReduce_31

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_1  4# happyReduction_1
happyReduction_1 _
	 =  HappyAbsSyn4
		 ([Pass]
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_1  4# happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (foldl' (++) [] (rights happy_var_1)
	)
happyReduction_2 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_1  5# happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_3  5# happyReduction_4
happyReduction_4 _
	(HappyTerminal happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1:happy_var_2
	)
happyReduction_4 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happySpecReduce_1  6# happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
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
happyReduce_7 = happySpecReduce_2  7# happyReduction_7
happyReduction_7 _
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_7 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_2  7# happyReduction_8
happyReduction_8 _
	_
	 =  HappyAbsSyn7
		 (Pass
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_2  7# happyReduction_9
happyReduction_9 _
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_9 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_1  7# happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_1  8# happyReduction_11
happyReduction_11 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_1  8# happyReduction_12
happyReduction_12 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_1  8# happyReduction_13
happyReduction_13 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_1  9# happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_1  9# happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_1  9# happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happySpecReduce_3  10# happyReduction_17
happyReduction_17 _
	_
	(HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn10
		 (F0Call happy_var_1
	)
happyReduction_17 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happyReduce 4# 11# happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyTerminal (Identifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (F1Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happyReduce 6# 12# happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyTerminal (Identifier happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (F2Call happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_3  13# happyReduction_20
happyReduction_20 (HappyAbsSyn22  happy_var_3)
	_
	(HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn13
		 (Assignment happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happyReduce 4# 14# happyReduction_21
happyReduction_21 ((HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (If ((IfClause happy_var_2 happy_var_4) []
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happyReduce 5# 14# happyReduction_22
happyReduction_22 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	(HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (If ((IfClause happy_var_2 happy_var_4) happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_23 = happySpecReduce_3  15# happyReduction_23
happyReduction_23 (HappyAbsSyn30  happy_var_3)
	_
	_
	 =  HappyAbsSyn15
		 (happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_24 = happyReduce 4# 16# happyReduction_24
happyReduction_24 ((HappyAbsSyn30  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_25 = happySpecReduce_2  17# happyReduction_25
happyReduction_25 (HappyAbsSyn22  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (Return happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_26 = happySpecReduce_1  18# happyReduction_26
happyReduction_26 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_27 = happySpecReduce_1  18# happyReduction_27
happyReduction_27 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_28 = happySpecReduce_1  18# happyReduction_28
happyReduction_28 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_29 = happyReduce 6# 19# happyReduction_29
happyReduction_29 ((HappyAbsSyn30  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (FuncDef (T.pack happy_var_2) [] happy_var_6
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_30 = happyReduce 7# 20# happyReduction_30
happyReduction_30 ((HappyAbsSyn30  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (FuncDef (T.pack happy_var_2) [happy_var_4] happy_var_7
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_31 = happyReduce 9# 21# happyReduction_31
happyReduction_31 ((HappyAbsSyn30  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_5) `HappyStk`
	(HappyTerminal (Identifier happy_var_4)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (FuncDef (T.pack happy_var_2) [happy_var_4, happy_var_5] happy_var_9
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_32 = happySpecReduce_1  22# happyReduction_32
happyReduction_32 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn22
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_33 = happySpecReduce_3  23# happyReduction_33
happyReduction_33 (HappyAbsSyn24  happy_var_3)
	_
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (BinOp (BoolOp Or) happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_34 = happySpecReduce_1  23# happyReduction_34
happyReduction_34 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn23
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_35 = happySpecReduce_3  24# happyReduction_35
happyReduction_35 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (BinOp (BoolOp And) happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_36 = happySpecReduce_1  24# happyReduction_36
happyReduction_36 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_37 = happySpecReduce_2  25# happyReduction_37
happyReduction_37 (HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn25
		 (UnaryOp Not happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_38 = happySpecReduce_1  25# happyReduction_38
happyReduction_38 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_39 = happySpecReduce_3  26# happyReduction_39
happyReduction_39 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (BinOp (CompOp Eq) happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_40 = happySpecReduce_3  26# happyReduction_40
happyReduction_40 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (BinOp (CompOp LessThanEq) happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_41 = happySpecReduce_3  26# happyReduction_41
happyReduction_41 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (BinOp (CompOp LessThan) happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_42 = happySpecReduce_3  26# happyReduction_42
happyReduction_42 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (BinOp (CompOp GreaterThanEq) happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_43 = happySpecReduce_3  26# happyReduction_43
happyReduction_43 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (BinOp (CompOp GreaterThan) happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_44 = happySpecReduce_1  26# happyReduction_44
happyReduction_44 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_45 = happySpecReduce_3  27# happyReduction_45
happyReduction_45 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (BinOp (ArithOp Add) happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_46 = happySpecReduce_3  27# happyReduction_46
happyReduction_46 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (BinOp (ArithOp Sub) happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_47 = happySpecReduce_1  27# happyReduction_47
happyReduction_47 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_48 = happySpecReduce_3  28# happyReduction_48
happyReduction_48 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn28
		 (BinOp (ArithOp Mul) happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_49 = happySpecReduce_3  28# happyReduction_49
happyReduction_49 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn28
		 (BinOp (ArithOp Div) happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_50 = happySpecReduce_1  28# happyReduction_50
happyReduction_50 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_51 = happySpecReduce_1  29# happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn29
		 (Name . T.pack $ s
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_52 = happySpecReduce_1  29# happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn29
		 (Constant $ ConstantBool True
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_53 = happySpecReduce_1  29# happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn29
		 (Constant $ ConstantBool False
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_54 = happySpecReduce_1  29# happyReduction_54
happyReduction_54 (HappyTerminal (Literal happy_var_1))
	 =  HappyAbsSyn29
		 (Constant happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_55 = happyReduce 4# 30# happyReduction_55
happyReduction_55 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (concat happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_56 = happySpecReduce_1  30# happyReduction_56
happyReduction_56 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 62# 62# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Keyword "def" -> cont 31#;
	Keyword "return" -> cont 32#;
	Keyword "while" -> cont 33#;
	Keyword "if" -> cont 34#;
	Keyword "True" -> cont 35#;
	Keyword "False" -> cont 36#;
	Keyword "pass" -> cont 37#;
	Operator "+" -> cont 38#;
	Operator "-" -> cont 39#;
	Operator "/" -> cont 40#;
	Operator "*" -> cont 41#;
	Operator "==" -> cont 42#;
	Operator ">" -> cont 43#;
	Operator "<" -> cont 44#;
	Operator ">=" -> cont 45#;
	Operator "<=" -> cont 46#;
	Keyword "and" -> cont 47#;
	Keyword "or" -> cont 48#;
	Keyword "not" -> cont 49#;
	Keyword "else" -> cont 50#;
	Delimiter "=" -> cont 51#;
	Delimiter "(" -> cont 52#;
	Delimiter ")" -> cont 53#;
	Delimiter ":" -> cont 54#;
	Delimiter "," -> cont 55#;
	Newline -> cont 56#;
	Indent -> cont 57#;
	Dedent -> cont 58#;
	Identifier happy_dollar_dollar -> cont 59#;
	Literal happy_dollar_dollar -> cont 60#;
	StringLiteral happy_dollar_dollar -> cont 61#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 62# tk tks = happyError' (tks, explist)
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


parseError =  fail "Parse error"
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
