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
happyExpList = HappyA# "\x00\x00\x40\x07\x08\x00\x41\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x00\x00\x40\x40\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\xe4\x01\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x40\x07\x08\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x40\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x40\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x00\x70\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x30\x00\x08\x70\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x40\x07\x08\x00\x40\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseTokens","input","statements","statement","simple_stmt","compound_stmt","assignment","if_stmt","while_stmt","return_stmt","function_def","expression","disjunction","conjunction","inversion","comparison","sum","term","atom","block","\"def\"","\":\"","\"return\"","\"while\"","\"if\"","\"else\"","\"True\"","\"False\"","\"+\"","\"-\"","\"/\"","\"*\"","\"==\"","\"pass\"","\"print\"","\">\"","\"<\"","\">=\"","\"<=\"","\"and\"","\"or\"","\"not\"","\"=\"","\"(\"","\")\"","\",\"","NEWLINE","INDENT","DEDENT","str","float","int","name","%eof"]
        bit_start = st * 56
        bit_end = (st + 1) * 56
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..55]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (23#) = happyShift action_13
action_0 (25#) = happyShift action_14
action_0 (26#) = happyShift action_15
action_0 (27#) = happyShift action_16
action_0 (36#) = happyShift action_17
action_0 (49#) = happyShift action_2
action_0 (55#) = happyShift action_18
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

action_3 (56#) = happyAccept
action_3 x = happyTcHack x happyFail (happyExpListPerState 3)

action_4 x = happyTcHack x happyReduce_2

action_5 (49#) = happyShift action_38
action_5 x = happyTcHack x happyReduce_3

action_6 x = happyTcHack x happyReduce_6

action_7 x = happyTcHack x happyReduce_5

action_8 x = happyTcHack x happyReduce_7

action_9 x = happyTcHack x happyReduce_14

action_10 x = happyTcHack x happyReduce_15

action_11 x = happyTcHack x happyReduce_9

action_12 x = happyTcHack x happyReduce_13

action_13 (55#) = happyShift action_37
action_13 x = happyTcHack x happyFail (happyExpListPerState 13)

action_14 (29#) = happyShift action_29
action_14 (30#) = happyShift action_30
action_14 (44#) = happyShift action_31
action_14 (53#) = happyShift action_32
action_14 (54#) = happyShift action_33
action_14 (55#) = happyShift action_34
action_14 (14#) = happyGoto action_36
action_14 (15#) = happyGoto action_22
action_14 (16#) = happyGoto action_23
action_14 (17#) = happyGoto action_24
action_14 (18#) = happyGoto action_25
action_14 (19#) = happyGoto action_26
action_14 (20#) = happyGoto action_27
action_14 (21#) = happyGoto action_28
action_14 x = happyTcHack x happyFail (happyExpListPerState 14)

action_15 (29#) = happyShift action_29
action_15 (30#) = happyShift action_30
action_15 (44#) = happyShift action_31
action_15 (53#) = happyShift action_32
action_15 (54#) = happyShift action_33
action_15 (55#) = happyShift action_34
action_15 (14#) = happyGoto action_35
action_15 (15#) = happyGoto action_22
action_15 (16#) = happyGoto action_23
action_15 (17#) = happyGoto action_24
action_15 (18#) = happyGoto action_25
action_15 (19#) = happyGoto action_26
action_15 (20#) = happyGoto action_27
action_15 (21#) = happyGoto action_28
action_15 x = happyTcHack x happyFail (happyExpListPerState 15)

action_16 (29#) = happyShift action_29
action_16 (30#) = happyShift action_30
action_16 (44#) = happyShift action_31
action_16 (53#) = happyShift action_32
action_16 (54#) = happyShift action_33
action_16 (55#) = happyShift action_34
action_16 (14#) = happyGoto action_21
action_16 (15#) = happyGoto action_22
action_16 (16#) = happyGoto action_23
action_16 (17#) = happyGoto action_24
action_16 (18#) = happyGoto action_25
action_16 (19#) = happyGoto action_26
action_16 (20#) = happyGoto action_27
action_16 (21#) = happyGoto action_28
action_16 x = happyTcHack x happyFail (happyExpListPerState 16)

action_17 x = happyTcHack x happyReduce_8

action_18 (45#) = happyShift action_19
action_18 (46#) = happyShift action_20
action_18 x = happyTcHack x happyFail (happyExpListPerState 18)

action_19 (29#) = happyShift action_29
action_19 (30#) = happyShift action_30
action_19 (44#) = happyShift action_31
action_19 (53#) = happyShift action_32
action_19 (54#) = happyShift action_33
action_19 (55#) = happyShift action_34
action_19 (14#) = happyGoto action_58
action_19 (15#) = happyGoto action_22
action_19 (16#) = happyGoto action_23
action_19 (17#) = happyGoto action_24
action_19 (18#) = happyGoto action_25
action_19 (19#) = happyGoto action_26
action_19 (20#) = happyGoto action_27
action_19 (21#) = happyGoto action_28
action_19 x = happyTcHack x happyFail (happyExpListPerState 19)

action_20 (47#) = happyShift action_56
action_20 (55#) = happyShift action_57
action_20 x = happyTcHack x happyFail (happyExpListPerState 20)

action_21 (24#) = happyShift action_55
action_21 x = happyTcHack x happyFail (happyExpListPerState 21)

action_22 x = happyTcHack x happyReduce_24

action_23 (43#) = happyShift action_54
action_23 x = happyTcHack x happyReduce_26

action_24 (42#) = happyShift action_53
action_24 x = happyTcHack x happyReduce_28

action_25 x = happyTcHack x happyReduce_30

action_26 (31#) = happyShift action_46
action_26 (32#) = happyShift action_47
action_26 (35#) = happyShift action_48
action_26 (38#) = happyShift action_49
action_26 (39#) = happyShift action_50
action_26 (40#) = happyShift action_51
action_26 (41#) = happyShift action_52
action_26 x = happyTcHack x happyReduce_36

action_27 (33#) = happyShift action_44
action_27 (34#) = happyShift action_45
action_27 x = happyTcHack x happyReduce_39

action_28 x = happyTcHack x happyReduce_42

action_29 x = happyTcHack x happyReduce_47

action_30 x = happyTcHack x happyReduce_48

action_31 (29#) = happyShift action_29
action_31 (30#) = happyShift action_30
action_31 (44#) = happyShift action_31
action_31 (53#) = happyShift action_32
action_31 (54#) = happyShift action_33
action_31 (55#) = happyShift action_34
action_31 (17#) = happyGoto action_43
action_31 (18#) = happyGoto action_25
action_31 (19#) = happyGoto action_26
action_31 (20#) = happyGoto action_27
action_31 (21#) = happyGoto action_28
action_31 x = happyTcHack x happyFail (happyExpListPerState 31)

action_32 x = happyTcHack x happyReduce_50

action_33 x = happyTcHack x happyReduce_49

action_34 (46#) = happyShift action_42
action_34 x = happyTcHack x happyReduce_43

action_35 (24#) = happyShift action_41
action_35 x = happyTcHack x happyFail (happyExpListPerState 35)

action_36 x = happyTcHack x happyReduce_20

action_37 (46#) = happyShift action_40
action_37 x = happyTcHack x happyFail (happyExpListPerState 37)

action_38 (23#) = happyShift action_13
action_38 (25#) = happyShift action_14
action_38 (26#) = happyShift action_15
action_38 (27#) = happyShift action_16
action_38 (36#) = happyShift action_17
action_38 (55#) = happyShift action_18
action_38 (5#) = happyGoto action_39
action_38 (6#) = happyGoto action_5
action_38 (7#) = happyGoto action_6
action_38 (8#) = happyGoto action_7
action_38 (9#) = happyGoto action_8
action_38 (10#) = happyGoto action_9
action_38 (11#) = happyGoto action_10
action_38 (12#) = happyGoto action_11
action_38 (13#) = happyGoto action_12
action_38 x = happyTcHack x happyFail (happyExpListPerState 38)

action_39 x = happyTcHack x happyReduce_4

action_40 (47#) = happyShift action_77
action_40 (55#) = happyShift action_78
action_40 x = happyTcHack x happyFail (happyExpListPerState 40)

action_41 (49#) = happyShift action_62
action_41 (22#) = happyGoto action_76
action_41 x = happyTcHack x happyFail (happyExpListPerState 41)

action_42 (47#) = happyShift action_74
action_42 (55#) = happyShift action_75
action_42 x = happyTcHack x happyFail (happyExpListPerState 42)

action_43 x = happyTcHack x happyReduce_29

action_44 (29#) = happyShift action_29
action_44 (30#) = happyShift action_30
action_44 (53#) = happyShift action_32
action_44 (54#) = happyShift action_33
action_44 (55#) = happyShift action_34
action_44 (21#) = happyGoto action_73
action_44 x = happyTcHack x happyFail (happyExpListPerState 44)

action_45 (29#) = happyShift action_29
action_45 (30#) = happyShift action_30
action_45 (53#) = happyShift action_32
action_45 (54#) = happyShift action_33
action_45 (55#) = happyShift action_34
action_45 (21#) = happyGoto action_72
action_45 x = happyTcHack x happyFail (happyExpListPerState 45)

action_46 (29#) = happyShift action_29
action_46 (30#) = happyShift action_30
action_46 (53#) = happyShift action_32
action_46 (54#) = happyShift action_33
action_46 (55#) = happyShift action_34
action_46 (20#) = happyGoto action_71
action_46 (21#) = happyGoto action_28
action_46 x = happyTcHack x happyFail (happyExpListPerState 46)

action_47 (29#) = happyShift action_29
action_47 (30#) = happyShift action_30
action_47 (53#) = happyShift action_32
action_47 (54#) = happyShift action_33
action_47 (55#) = happyShift action_34
action_47 (20#) = happyGoto action_70
action_47 (21#) = happyGoto action_28
action_47 x = happyTcHack x happyFail (happyExpListPerState 47)

action_48 (29#) = happyShift action_29
action_48 (30#) = happyShift action_30
action_48 (53#) = happyShift action_32
action_48 (54#) = happyShift action_33
action_48 (55#) = happyShift action_34
action_48 (19#) = happyGoto action_69
action_48 (20#) = happyGoto action_27
action_48 (21#) = happyGoto action_28
action_48 x = happyTcHack x happyFail (happyExpListPerState 48)

action_49 (29#) = happyShift action_29
action_49 (30#) = happyShift action_30
action_49 (53#) = happyShift action_32
action_49 (54#) = happyShift action_33
action_49 (55#) = happyShift action_34
action_49 (19#) = happyGoto action_68
action_49 (20#) = happyGoto action_27
action_49 (21#) = happyGoto action_28
action_49 x = happyTcHack x happyFail (happyExpListPerState 49)

action_50 (29#) = happyShift action_29
action_50 (30#) = happyShift action_30
action_50 (53#) = happyShift action_32
action_50 (54#) = happyShift action_33
action_50 (55#) = happyShift action_34
action_50 (19#) = happyGoto action_67
action_50 (20#) = happyGoto action_27
action_50 (21#) = happyGoto action_28
action_50 x = happyTcHack x happyFail (happyExpListPerState 50)

action_51 (29#) = happyShift action_29
action_51 (30#) = happyShift action_30
action_51 (53#) = happyShift action_32
action_51 (54#) = happyShift action_33
action_51 (55#) = happyShift action_34
action_51 (19#) = happyGoto action_66
action_51 (20#) = happyGoto action_27
action_51 (21#) = happyGoto action_28
action_51 x = happyTcHack x happyFail (happyExpListPerState 51)

action_52 (29#) = happyShift action_29
action_52 (30#) = happyShift action_30
action_52 (53#) = happyShift action_32
action_52 (54#) = happyShift action_33
action_52 (55#) = happyShift action_34
action_52 (19#) = happyGoto action_65
action_52 (20#) = happyGoto action_27
action_52 (21#) = happyGoto action_28
action_52 x = happyTcHack x happyFail (happyExpListPerState 52)

action_53 (29#) = happyShift action_29
action_53 (30#) = happyShift action_30
action_53 (44#) = happyShift action_31
action_53 (53#) = happyShift action_32
action_53 (54#) = happyShift action_33
action_53 (55#) = happyShift action_34
action_53 (17#) = happyGoto action_64
action_53 (18#) = happyGoto action_25
action_53 (19#) = happyGoto action_26
action_53 (20#) = happyGoto action_27
action_53 (21#) = happyGoto action_28
action_53 x = happyTcHack x happyFail (happyExpListPerState 53)

action_54 (29#) = happyShift action_29
action_54 (30#) = happyShift action_30
action_54 (44#) = happyShift action_31
action_54 (53#) = happyShift action_32
action_54 (54#) = happyShift action_33
action_54 (55#) = happyShift action_34
action_54 (16#) = happyGoto action_63
action_54 (17#) = happyGoto action_24
action_54 (18#) = happyGoto action_25
action_54 (19#) = happyGoto action_26
action_54 (20#) = happyGoto action_27
action_54 (21#) = happyGoto action_28
action_54 x = happyTcHack x happyFail (happyExpListPerState 54)

action_55 (49#) = happyShift action_62
action_55 (22#) = happyGoto action_61
action_55 x = happyTcHack x happyFail (happyExpListPerState 55)

action_56 x = happyTcHack x happyReduce_10

action_57 (47#) = happyShift action_59
action_57 (48#) = happyShift action_60
action_57 x = happyTcHack x happyFail (happyExpListPerState 57)

action_58 x = happyTcHack x happyReduce_16

action_59 x = happyTcHack x happyReduce_11

action_60 (55#) = happyShift action_86
action_60 x = happyTcHack x happyFail (happyExpListPerState 60)

action_61 (28#) = happyShift action_85
action_61 x = happyTcHack x happyReduce_17

action_62 (50#) = happyShift action_84
action_62 x = happyTcHack x happyFail (happyExpListPerState 62)

action_63 x = happyTcHack x happyReduce_25

action_64 x = happyTcHack x happyReduce_27

action_65 (31#) = happyShift action_46
action_65 (32#) = happyShift action_47
action_65 x = happyTcHack x happyReduce_32

action_66 (31#) = happyShift action_46
action_66 (32#) = happyShift action_47
action_66 x = happyTcHack x happyReduce_34

action_67 (31#) = happyShift action_46
action_67 (32#) = happyShift action_47
action_67 x = happyTcHack x happyReduce_33

action_68 (31#) = happyShift action_46
action_68 (32#) = happyShift action_47
action_68 x = happyTcHack x happyReduce_35

action_69 (31#) = happyShift action_46
action_69 (32#) = happyShift action_47
action_69 x = happyTcHack x happyReduce_31

action_70 (33#) = happyShift action_44
action_70 (34#) = happyShift action_45
action_70 x = happyTcHack x happyReduce_38

action_71 (33#) = happyShift action_44
action_71 (34#) = happyShift action_45
action_71 x = happyTcHack x happyReduce_37

action_72 x = happyTcHack x happyReduce_40

action_73 x = happyTcHack x happyReduce_41

action_74 x = happyTcHack x happyReduce_44

action_75 (47#) = happyShift action_82
action_75 (48#) = happyShift action_83
action_75 x = happyTcHack x happyFail (happyExpListPerState 75)

action_76 x = happyTcHack x happyReduce_19

action_77 (24#) = happyShift action_81
action_77 x = happyTcHack x happyFail (happyExpListPerState 77)

action_78 (47#) = happyShift action_79
action_78 (48#) = happyShift action_80
action_78 x = happyTcHack x happyFail (happyExpListPerState 78)

action_79 (24#) = happyShift action_93
action_79 x = happyTcHack x happyFail (happyExpListPerState 79)

action_80 (55#) = happyShift action_92
action_80 x = happyTcHack x happyFail (happyExpListPerState 80)

action_81 (49#) = happyShift action_62
action_81 (22#) = happyGoto action_91
action_81 x = happyTcHack x happyFail (happyExpListPerState 81)

action_82 x = happyTcHack x happyReduce_45

action_83 (55#) = happyShift action_90
action_83 x = happyTcHack x happyFail (happyExpListPerState 83)

action_84 (23#) = happyShift action_13
action_84 (25#) = happyShift action_14
action_84 (26#) = happyShift action_15
action_84 (27#) = happyShift action_16
action_84 (36#) = happyShift action_17
action_84 (55#) = happyShift action_18
action_84 (5#) = happyGoto action_89
action_84 (6#) = happyGoto action_5
action_84 (7#) = happyGoto action_6
action_84 (8#) = happyGoto action_7
action_84 (9#) = happyGoto action_8
action_84 (10#) = happyGoto action_9
action_84 (11#) = happyGoto action_10
action_84 (12#) = happyGoto action_11
action_84 (13#) = happyGoto action_12
action_84 x = happyTcHack x happyFail (happyExpListPerState 84)

action_85 (24#) = happyShift action_88
action_85 x = happyTcHack x happyFail (happyExpListPerState 85)

action_86 (47#) = happyShift action_87
action_86 x = happyTcHack x happyFail (happyExpListPerState 86)

action_87 x = happyTcHack x happyReduce_12

action_88 (49#) = happyShift action_62
action_88 (22#) = happyGoto action_98
action_88 x = happyTcHack x happyFail (happyExpListPerState 88)

action_89 (51#) = happyShift action_97
action_89 x = happyTcHack x happyFail (happyExpListPerState 89)

action_90 (47#) = happyShift action_96
action_90 x = happyTcHack x happyFail (happyExpListPerState 90)

action_91 x = happyTcHack x happyReduce_21

action_92 (47#) = happyShift action_95
action_92 x = happyTcHack x happyFail (happyExpListPerState 92)

action_93 (49#) = happyShift action_62
action_93 (22#) = happyGoto action_94
action_93 x = happyTcHack x happyFail (happyExpListPerState 93)

action_94 x = happyTcHack x happyReduce_22

action_95 (24#) = happyShift action_99
action_95 x = happyTcHack x happyFail (happyExpListPerState 95)

action_96 x = happyTcHack x happyReduce_46

action_97 x = happyTcHack x happyReduce_51

action_98 x = happyTcHack x happyReduce_18

action_99 (49#) = happyShift action_62
action_99 (22#) = happyGoto action_100
action_99 x = happyTcHack x happyFail (happyExpListPerState 99)

action_100 x = happyTcHack x happyReduce_23

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
happyReduce_9 = happySpecReduce_1  7# happyReduction_9
happyReduction_9 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_3  7# happyReduction_10
happyReduction_10 _
	_
	(HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn7
		 (F0CallS happy_var_1
	)
happyReduction_10 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happyReduce 4# 7# happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (F1CallS happy_var_1 happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happyReduce 6# 7# happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (F2CallS happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_1  8# happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_1  8# happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_1  8# happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_3  9# happyReduction_16
happyReduction_16 (HappyAbsSyn14  happy_var_3)
	_
	(HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn9
		 (G.Assignment happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happyReduce 4# 10# happyReduction_17
happyReduction_17 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (G.If happy_var_2 happy_var_4
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happyReduce 7# 10# happyReduction_18
happyReduction_18 ((HappyAbsSyn22  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (G.IfElse happy_var_2 happy_var_4 happy_var_7
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
happyReduction_43 (HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn21
		 (G.Var happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_44 = happySpecReduce_3  21# happyReduction_44
happyReduction_44 _
	_
	(HappyTerminal (Lexer.Name happy_var_1))
	 =  HappyAbsSyn21
		 (G.F0CallE happy_var_1
	)
happyReduction_44 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_45 = happyReduce 4# 21# happyReduction_45
happyReduction_45 (_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (G.F1CallE happy_var_1 happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_46 = happyReduce 6# 21# happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Lexer.Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (G.F2CallE happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_47 = happySpecReduce_1  21# happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn21
		 (G.MyTrue
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_48 = happySpecReduce_1  21# happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn21
		 (G.MyFalse
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_49 = happySpecReduce_1  21# happyReduction_49
happyReduction_49 (HappyTerminal (Lexer.MyInt happy_var_1))
	 =  HappyAbsSyn21
		 (G.MyInt happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_50 = happySpecReduce_1  21# happyReduction_50
happyReduction_50 (HappyTerminal (Lexer.MyFloat happy_var_1))
	 =  HappyAbsSyn21
		 (G.MyFloat happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_51 = happyReduce 4# 22# happyReduction_51
happyReduction_51 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 56# 56# notHappyAtAll (HappyState action) sts stk []

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
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 56# tk tks = happyError' (tks, explist)
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
