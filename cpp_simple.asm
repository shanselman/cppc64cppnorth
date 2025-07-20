; Compiled with 1.31.262
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e a9 1e STX $1ea9 ; (spentry + 0)
0811 : a2 1e __ LDX #$1e
0813 : a0 c6 __ LDY #$c6
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1e __ CPX #$1e
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 c6 __ CPY #$c6
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 4d __ LDA #$4d
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1000 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
0880 : a5 53 __ LDA T0 + 0 
0882 : 8d 4f 9f STA $9f4f ; (main@stack + 0)
0885 : 38 __ __ SEC
0886 : a5 23 __ LDA SP + 0 
0888 : e9 04 __ SBC #$04
088a : 85 23 __ STA SP + 0 
088c : b0 02 __ BCS $0890 ; (main.s0 + 0)
088e : c6 24 __ DEC SP + 1 
.s0:
0890 : a9 01 __ LDA #$01
0892 : 8d 20 d0 STA $d020 
0895 : 8d 21 d0 STA $d021 
0898 : a9 93 __ LDA #$93
089a : 20 d2 ff JSR $ffd2 
089d : a9 0e __ LDA #$0e
089f : 8d 55 9f STA $9f55 ; (conference + 0)
08a2 : a9 04 __ LDA #$04
08a4 : 8d 56 9f STA $9f56 ; (conference + 1)
08a7 : a9 22 __ LDA #$22
08a9 : 8d 59 9f STA $9f59 ; (conference + 4)
08ac : a9 16 __ LDA #$16
08ae : 8d 5a 9f STA $9f5a ; (conference + 5)
08b1 : a9 02 __ LDA #$02
08b3 : 8d 86 02 STA $0286 
08b6 : a0 05 __ LDY #$05
08b8 : 8c 57 9f STY $9f57 ; (conference + 2)
08bb : a2 01 __ LDX #$01
08bd : 8e 58 9f STX $9f58 ; (conference + 3)
08c0 : 18 __ __ CLC
08c1 : 20 f0 ff JSR $fff0 
08c4 : a9 2b __ LDA #$2b
08c6 : 20 d2 ff JSR $ffd2 
08c9 : ad 57 9f LDA $9f57 ; (conference + 2)
08cc : 18 __ __ CLC
08cd : 69 01 __ ADC #$01
08cf : 85 53 __ STA T0 + 0 
08d1 : cd 59 9f CMP $9f59 ; (conference + 4)
08d4 : b0 0e __ BCS $08e4 ; (main.s46 + 0)
.l44:
08d6 : a9 2d __ LDA #$2d
08d8 : 20 d2 ff JSR $ffd2 
08db : e6 53 __ INC T0 + 0 
08dd : a5 53 __ LDA T0 + 0 
08df : cd 59 9f CMP $9f59 ; (conference + 4)
08e2 : 90 f2 __ BCC $08d6 ; (main.l44 + 0)
.s46:
08e4 : a9 2b __ LDA #$2b
08e6 : 20 d2 ff JSR $ffd2 
08e9 : ae 5a 9f LDX $9f5a ; (conference + 5)
08ec : ac 57 9f LDY $9f57 ; (conference + 2)
08ef : 18 __ __ CLC
08f0 : 20 f0 ff JSR $fff0 
08f3 : a9 2b __ LDA #$2b
08f5 : 20 d2 ff JSR $ffd2 
08f8 : ad 57 9f LDA $9f57 ; (conference + 2)
08fb : 18 __ __ CLC
08fc : 69 01 __ ADC #$01
08fe : 85 53 __ STA T0 + 0 
0900 : cd 59 9f CMP $9f59 ; (conference + 4)
0903 : b0 0e __ BCS $0913 ; (main.s146 + 0)
.l144:
0905 : a9 2d __ LDA #$2d
0907 : 20 d2 ff JSR $ffd2 
090a : e6 53 __ INC T0 + 0 
090c : a5 53 __ LDA T0 + 0 
090e : cd 59 9f CMP $9f59 ; (conference + 4)
0911 : 90 f2 __ BCC $0905 ; (main.l144 + 0)
.s146:
0913 : a9 2b __ LDA #$2b
0915 : 20 d2 ff JSR $ffd2 
0918 : ad 58 9f LDA $9f58 ; (conference + 3)
091b : 18 __ __ CLC
091c : 69 01 __ ADC #$01
091e : cd 5a 9f CMP $9f5a ; (conference + 5)
0921 : b0 25 __ BCS $0948 ; (main.s9 + 0)
.s212:
0923 : 85 53 __ STA T0 + 0 
.l1011:
0925 : aa __ __ TAX
0926 : ac 57 9f LDY $9f57 ; (conference + 2)
0929 : 20 f0 ff JSR $fff0 
092c : a9 7c __ LDA #$7c
092e : 20 d2 ff JSR $ffd2 
0931 : a6 53 __ LDX T0 + 0 
0933 : ac 59 9f LDY $9f59 ; (conference + 4)
0936 : 18 __ __ CLC
0937 : 20 f0 ff JSR $fff0 
093a : a9 7c __ LDA #$7c
093c : 20 d2 ff JSR $ffd2 
093f : e6 53 __ INC T0 + 0 
0941 : a5 53 __ LDA T0 + 0 
0943 : cd 5a 9f CMP $9f5a ; (conference + 5)
0946 : 90 dd __ BCC $0925 ; (main.l1011 + 0)
.s9:
0948 : a9 02 __ LDA #$02
094a : 8d 86 02 STA $0286 
094d : a9 12 __ LDA #$12
094f : 20 d2 ff JSR $ffd2 
0952 : ad 55 9f LDA $9f55 ; (conference + 0)
0955 : 18 __ __ CLC
0956 : 69 06 __ ADC #$06
0958 : a8 __ __ TAY
0959 : ae 56 9f LDX $9f56 ; (conference + 1)
095c : 18 __ __ CLC
095d : 20 f0 ff JSR $fff0 
0960 : a9 20 __ LDA #$20
0962 : 20 d2 ff JSR $ffd2 
0965 : ad 55 9f LDA $9f55 ; (conference + 0)
0968 : 18 __ __ CLC
0969 : 69 05 __ ADC #$05
096b : 85 0d __ STA P0 
096d : a8 __ __ TAY
096e : ae 56 9f LDX $9f56 ; (conference + 1)
0971 : e8 __ __ INX
0972 : 86 0e __ STX P1 
0974 : 18 __ __ CLC
0975 : 20 f0 ff JSR $fff0 
0978 : a9 b4 __ LDA #$b4
097a : a0 02 __ LDY #$02
097c : 91 23 __ STA (SP + 0),y 
097e : a9 18 __ LDA #$18
0980 : c8 __ __ INY
0981 : 91 23 __ STA (SP + 0),y 
0983 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0986 : a4 0d __ LDY P0 
0988 : a6 0e __ LDX P1 
098a : e8 __ __ INX
098b : 88 __ __ DEY
098c : 18 __ __ CLC
098d : 88 __ __ DEY
098e : 20 f0 ff JSR $fff0 
0991 : a9 20 __ LDA #$20
0993 : 20 d2 ff JSR $ffd2 
0996 : ad 55 9f LDA $9f55 ; (conference + 0)
0999 : 18 __ __ CLC
099a : 69 05 __ ADC #$05
099c : 85 0d __ STA P0 
099e : a8 __ __ TAY
099f : ad 56 9f LDA $9f56 ; (conference + 1)
09a2 : 18 __ __ CLC
09a3 : 69 02 __ ADC #$02
09a5 : 85 0e __ STA P1 
09a7 : aa __ __ TAX
09a8 : 18 __ __ CLC
09a9 : 20 f0 ff JSR $fff0 
09ac : a9 b4 __ LDA #$b4
09ae : a0 02 __ LDY #$02
09b0 : 91 23 __ STA (SP + 0),y 
09b2 : a9 18 __ LDA #$18
09b4 : c8 __ __ INY
09b5 : 91 23 __ STA (SP + 0),y 
09b7 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
09ba : 18 __ __ CLC
09bb : a5 0d __ LDA P0 
09bd : 69 04 __ ADC #$04
09bf : a8 __ __ TAY
09c0 : a6 0e __ LDX P1 
09c2 : 18 __ __ CLC
09c3 : 20 f0 ff JSR $fff0 
09c6 : a9 20 __ LDA #$20
09c8 : 20 d2 ff JSR $ffd2 
09cb : ad 55 9f LDA $9f55 ; (conference + 0)
09ce : 18 __ __ CLC
09cf : 69 02 __ ADC #$02
09d1 : 85 0d __ STA P0 
09d3 : a8 __ __ TAY
09d4 : ad 56 9f LDA $9f56 ; (conference + 1)
09d7 : 18 __ __ CLC
09d8 : 69 03 __ ADC #$03
09da : 85 0e __ STA P1 
09dc : aa __ __ TAX
09dd : 18 __ __ CLC
09de : 20 f0 ff JSR $fff0 
09e1 : a9 b4 __ LDA #$b4
09e3 : a0 02 __ LDY #$02
09e5 : 91 23 __ STA (SP + 0),y 
09e7 : a9 18 __ LDA #$18
09e9 : c8 __ __ INY
09ea : 91 23 __ STA (SP + 0),y 
09ec : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
09ef : 18 __ __ CLC
09f0 : a5 0d __ LDA P0 
09f2 : 69 04 __ ADC #$04
09f4 : a8 __ __ TAY
09f5 : a6 0e __ LDX P1 
09f7 : 18 __ __ CLC
09f8 : 20 f0 ff JSR $fff0 
09fb : a9 20 __ LDA #$20
09fd : 20 d2 ff JSR $ffd2 
0a00 : ad 55 9f LDA $9f55 ; (conference + 0)
0a03 : 18 __ __ CLC
0a04 : 69 08 __ ADC #$08
0a06 : 85 0d __ STA P0 
0a08 : a8 __ __ TAY
0a09 : ad 56 9f LDA $9f56 ; (conference + 1)
0a0c : 18 __ __ CLC
0a0d : 69 03 __ ADC #$03
0a0f : 85 0e __ STA P1 
0a11 : aa __ __ TAX
0a12 : 18 __ __ CLC
0a13 : 20 f0 ff JSR $fff0 
0a16 : a9 b4 __ LDA #$b4
0a18 : a0 02 __ LDY #$02
0a1a : 91 23 __ STA (SP + 0),y 
0a1c : a9 18 __ LDA #$18
0a1e : c8 __ __ INY
0a1f : 91 23 __ STA (SP + 0),y 
0a21 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0a24 : 18 __ __ CLC
0a25 : a5 0d __ LDA P0 
0a27 : 69 f9 __ ADC #$f9
0a29 : 85 0d __ STA P0 
0a2b : a8 __ __ TAY
0a2c : e6 0e __ INC P1 
0a2e : a6 0e __ LDX P1 
0a30 : 18 __ __ CLC
0a31 : 20 f0 ff JSR $fff0 
0a34 : a9 b8 __ LDA #$b8
0a36 : a0 02 __ LDY #$02
0a38 : 91 23 __ STA (SP + 0),y 
0a3a : a9 18 __ LDA #$18
0a3c : c8 __ __ INY
0a3d : 91 23 __ STA (SP + 0),y 
0a3f : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0a42 : e6 0d __ INC P0 
0a44 : e6 0e __ INC P1 
0a46 : a4 0d __ LDY P0 
0a48 : a6 0e __ LDX P1 
0a4a : 18 __ __ CLC
0a4b : 20 f0 ff JSR $fff0 
0a4e : a9 c4 __ LDA #$c4
0a50 : a0 02 __ LDY #$02
0a52 : 91 23 __ STA (SP + 0),y 
0a54 : a9 18 __ LDA #$18
0a56 : c8 __ __ INY
0a57 : 91 23 __ STA (SP + 0),y 
0a59 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0a5c : e6 0d __ INC P0 
0a5e : e6 0e __ INC P1 
0a60 : a4 0d __ LDY P0 
0a62 : a6 0e __ LDX P1 
0a64 : 18 __ __ CLC
0a65 : 20 f0 ff JSR $fff0 
0a68 : a9 ce __ LDA #$ce
0a6a : a0 02 __ LDY #$02
0a6c : 91 23 __ STA (SP + 0),y 
0a6e : a9 18 __ LDA #$18
0a70 : c8 __ __ INY
0a71 : 91 23 __ STA (SP + 0),y 
0a73 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0a76 : e6 0d __ INC P0 
0a78 : e6 0e __ INC P1 
0a7a : a4 0d __ LDY P0 
0a7c : a6 0e __ LDX P1 
0a7e : 18 __ __ CLC
0a7f : 20 f0 ff JSR $fff0 
0a82 : a9 d6 __ LDA #$d6
0a84 : a0 02 __ LDY #$02
0a86 : 91 23 __ STA (SP + 0),y 
0a88 : a9 18 __ LDA #$18
0a8a : c8 __ __ INY
0a8b : 91 23 __ STA (SP + 0),y 
0a8d : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0a90 : a4 0d __ LDY P0 
0a92 : a6 0e __ LDX P1 
0a94 : e8 __ __ INX
0a95 : c8 __ __ INY
0a96 : 18 __ __ CLC
0a97 : c8 __ __ INY
0a98 : 20 f0 ff JSR $fff0 
0a9b : a9 20 __ LDA #$20
0a9d : 20 d2 ff JSR $ffd2 
0aa0 : ad 55 9f LDA $9f55 ; (conference + 0)
0aa3 : 18 __ __ CLC
0aa4 : 69 06 __ ADC #$06
0aa6 : a8 __ __ TAY
0aa7 : ad 56 9f LDA $9f56 ; (conference + 1)
0aaa : 18 __ __ CLC
0aab : 69 09 __ ADC #$09
0aad : aa __ __ TAX
0aae : 18 __ __ CLC
0aaf : 20 f0 ff JSR $fff0 
0ab2 : a9 20 __ LDA #$20
0ab4 : 20 d2 ff JSR $ffd2 
0ab7 : a9 92 __ LDA #$92
0ab9 : 20 d2 ff JSR $ffd2 
0abc : a9 00 __ LDA #$00
0abe : 8d 86 02 STA $0286 
0ac1 : a0 0a __ LDY #$0a
0ac3 : a2 03 __ LDX #$03
0ac5 : 18 __ __ CLC
0ac6 : 20 f0 ff JSR $fff0 
0ac9 : a9 dc __ LDA #$dc
0acb : a0 02 __ LDY #$02
0acd : 91 23 __ STA (SP + 0),y 
0acf : a9 18 __ LDA #$18
0ad1 : c8 __ __ INY
0ad2 : 91 23 __ STA (SP + 0),y 
0ad4 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0ad7 : a9 0c __ LDA #$0c
0ad9 : 8d 86 02 STA $0286 
0adc : a0 09 __ LDY #$09
0ade : a2 13 __ LDX #$13
0ae0 : 18 __ __ CLC
0ae1 : 20 f0 ff JSR $fff0 
0ae4 : a9 00 __ LDA #$00
0ae6 : a0 02 __ LDY #$02
0ae8 : 91 23 __ STA (SP + 0),y 
0aea : a9 19 __ LDA #$19
0aec : c8 __ __ INY
0aed : 91 23 __ STA (SP + 0),y 
0aef : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0af2 : a9 00 __ LDA #$00
0af4 : 8d 86 02 STA $0286 
0af7 : a0 0b __ LDY #$0b
0af9 : a2 18 __ LDX #$18
0afb : 18 __ __ CLC
0afc : 20 f0 ff JSR $fff0 
0aff : a9 ef __ LDA #$ef
0b01 : a0 02 __ LDY #$02
0b03 : 91 23 __ STA (SP + 0),y 
0b05 : a9 18 __ LDA #$18
0b07 : c8 __ __ INY
0b08 : 91 23 __ STA (SP + 0),y 
0b0a : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0b0d : a9 02 __ LDA #$02
0b0f : 8d 86 02 STA $0286 
0b12 : a0 0b __ LDY #$0b
0b14 : a2 10 __ LDX #$10
0b16 : 18 __ __ CLC
0b17 : 20 f0 ff JSR $fff0 
0b1a : a9 18 __ LDA #$18
0b1c : a0 02 __ LDY #$02
0b1e : 91 23 __ STA (SP + 0),y 
0b20 : a9 19 __ LDA #$19
0b22 : c8 __ __ INY
0b23 : 91 23 __ STA (SP + 0),y 
0b25 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0b28 : a9 00 __ LDA #$00
0b2a : 8d 86 02 STA $0286 
0b2d : a0 11 __ LDY #$11
0b2f : a2 10 __ LDX #$10
0b31 : 18 __ __ CLC
0b32 : 20 f0 ff JSR $fff0 
0b35 : a9 1f __ LDA #$1f
0b37 : a0 02 __ LDY #$02
0b39 : 91 23 __ STA (SP + 0),y 
0b3b : a9 19 __ LDA #$19
0b3d : c8 __ __ INY
0b3e : 91 23 __ STA (SP + 0),y 
0b40 : 20 5d 0b JSR $0b5d ; (printf.s1000 + 0)
0b43 : 20 cf ff JSR $ffcf 
0b46 : a9 00 __ LDA #$00
0b48 : 85 1b __ STA ACCU + 0 
0b4a : 85 1c __ STA ACCU + 1 
.s1001:
0b4c : 18 __ __ CLC
0b4d : a5 23 __ LDA SP + 0 
0b4f : 69 04 __ ADC #$04
0b51 : 85 23 __ STA SP + 0 
0b53 : 90 02 __ BCC $0b57 ; (main.s1001 + 11)
0b55 : e6 24 __ INC SP + 1 
0b57 : ad 4f 9f LDA $9f4f ; (main@stack + 0)
0b5a : 85 53 __ STA T0 + 0 
0b5c : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s1000:
0b5d : a2 05 __ LDX #$05
0b5f : b5 53 __ LDA T6 + 0,x 
0b61 : 9d 5d 9f STA $9f5d,x ; (printf@stack + 0)
0b64 : ca __ __ DEX
0b65 : 10 f8 __ BPL $0b5f ; (printf.s1000 + 2)
.s0:
0b67 : a0 02 __ LDY #$02
0b69 : b1 23 __ LDA (SP + 0),y 
0b6b : 85 43 __ STA T0 + 0 
0b6d : c8 __ __ INY
0b6e : b1 23 __ LDA (SP + 0),y 
0b70 : 85 44 __ STA T0 + 1 
0b72 : a0 00 __ LDY #$00
0b74 : 84 47 __ STY T1 + 0 
0b76 : b1 43 __ LDA (T0 + 0),y 
0b78 : d0 03 __ BNE $0b7d ; (printf.s1891 + 0)
0b7a : 4c 69 18 JMP $1869 ; (printf.s4 + 0)
.s1891:
0b7d : aa __ __ TAX
0b7e : 18 __ __ CLC
0b7f : a5 43 __ LDA T0 + 0 
0b81 : 69 01 __ ADC #$01
0b83 : 85 4b __ STA T2 + 0 
0b85 : a5 44 __ LDA T0 + 1 
0b87 : 69 00 __ ADC #$00
0b89 : 85 4c __ STA T2 + 1 
0b8b : 18 __ __ CLC
0b8c : a5 23 __ LDA SP + 0 
0b8e : 69 04 __ ADC #$04
0b90 : 85 4d __ STA T3 + 0 
0b92 : a5 24 __ LDA SP + 1 
0b94 : 69 00 __ ADC #$00
0b96 : 85 4e __ STA T3 + 1 
0b98 : 8a __ __ TXA
0b99 : e0 25 __ CPX #$25
0b9b : f0 5d __ BEQ $0bfa ; (printf.l5 + 0)
.s6:
0b9d : a6 47 __ LDX T1 + 0 
0b9f : e8 __ __ INX
0ba0 : 86 47 __ STX T1 + 0 
0ba2 : 9d cd 9f STA $9fcd,x ; (si + 7)
0ba5 : e0 28 __ CPX #$28
0ba7 : 90 3f __ BCC $0be8 ; (printf.l2 + 0)
.s332:
0ba9 : 98 __ __ TYA
0baa : 9d ce 9f STA $9fce,x ; (buff + 0)
0bad : ad ce 9f LDA $9fce ; (buff + 0)
0bb0 : f0 34 __ BEQ $0be6 ; (printf.l1092 + 0)
.s1896:
0bb2 : aa __ __ TAX
0bb3 : a9 01 __ LDA #$01
0bb5 : 85 47 __ STA T1 + 0 
.l335:
0bb7 : 8a __ __ TXA
0bb8 : e0 0a __ CPX #$0a
0bba : d0 08 __ BNE $0bc4 ; (printf.s339 + 0)
.s338:
0bbc : a9 0d __ LDA #$0d
.s1089:
0bbe : 20 d2 ff JSR $ffd2 
0bc1 : 4c db 0b JMP $0bdb ; (printf.s334 + 0)
.s339:
0bc4 : c9 09 __ CMP #$09
0bc6 : d0 f6 __ BNE $0bbe ; (printf.s1089 + 0)
.s340:
0bc8 : a5 d3 __ LDA $d3 
0bca : 29 03 __ AND #$03
0bcc : 85 43 __ STA T0 + 0 
.l342:
0bce : a9 20 __ LDA #$20
0bd0 : 20 d2 ff JSR $ffd2 
0bd3 : e6 43 __ INC T0 + 0 
0bd5 : a5 43 __ LDA T0 + 0 
0bd7 : c9 04 __ CMP #$04
0bd9 : 90 f3 __ BCC $0bce ; (printf.l342 + 0)
.s334:
0bdb : a6 47 __ LDX T1 + 0 
0bdd : bd ce 9f LDA $9fce,x ; (buff + 0)
0be0 : e6 47 __ INC T1 + 0 
0be2 : aa __ __ TAX
0be3 : a8 __ __ TAY
0be4 : d0 d1 __ BNE $0bb7 ; (printf.l335 + 0)
.l1092:
0be6 : 85 47 __ STA T1 + 0 
.l2:
0be8 : a0 00 __ LDY #$00
0bea : b1 4b __ LDA (T2 + 0),y 
0bec : aa __ __ TAX
0bed : e6 4b __ INC T2 + 0 
0bef : d0 02 __ BNE $0bf3 ; (printf.s1324 + 0)
.s1323:
0bf1 : e6 4c __ INC T2 + 1 
.s1324:
0bf3 : 8a __ __ TXA
0bf4 : f0 84 __ BEQ $0b7a ; (printf.s0 + 19)
.s3:
0bf6 : c9 25 __ CMP #$25
0bf8 : d0 a3 __ BNE $0b9d ; (printf.s6 + 0)
.l5:
0bfa : a6 47 __ LDX T1 + 0 
0bfc : f0 40 __ BEQ $0c3e ; (printf.s8 + 0)
.s7:
0bfe : a9 00 __ LDA #$00
0c00 : 9d ce 9f STA $9fce,x ; (buff + 0)
0c03 : ad ce 9f LDA $9fce ; (buff + 0)
0c06 : f0 34 __ BEQ $0c3c ; (printf.s9 + 0)
.s1892:
0c08 : aa __ __ TAX
0c09 : a9 01 __ LDA #$01
0c0b : 85 47 __ STA T1 + 0 
.l11:
0c0d : 8a __ __ TXA
0c0e : e0 0a __ CPX #$0a
0c10 : d0 08 __ BNE $0c1a ; (printf.s15 + 0)
.s14:
0c12 : a9 0d __ LDA #$0d
.s1085:
0c14 : 20 d2 ff JSR $ffd2 
0c17 : 4c 31 0c JMP $0c31 ; (printf.s10 + 0)
.s15:
0c1a : c9 09 __ CMP #$09
0c1c : d0 f6 __ BNE $0c14 ; (printf.s1085 + 0)
.s16:
0c1e : a5 d3 __ LDA $d3 
0c20 : 29 03 __ AND #$03
0c22 : 85 43 __ STA T0 + 0 
.l18:
0c24 : a9 20 __ LDA #$20
0c26 : 20 d2 ff JSR $ffd2 
0c29 : e6 43 __ INC T0 + 0 
0c2b : a5 43 __ LDA T0 + 0 
0c2d : c9 04 __ CMP #$04
0c2f : 90 f3 __ BCC $0c24 ; (printf.l18 + 0)
.s10:
0c31 : a6 47 __ LDX T1 + 0 
0c33 : bd ce 9f LDA $9fce,x ; (buff + 0)
0c36 : e6 47 __ INC T1 + 0 
0c38 : aa __ __ TAX
0c39 : a8 __ __ TAY
0c3a : d0 d1 __ BNE $0c0d ; (printf.l11 + 0)
.s9:
0c3c : 85 47 __ STA T1 + 0 
.s8:
0c3e : a9 00 __ LDA #$00
0c40 : 8d c7 9f STA $9fc7 ; (si + 1)
0c43 : 8d cb 9f STA $9fcb ; (si + 5)
0c46 : 8d cc 9f STA $9fcc ; (si + 6)
0c49 : 8d cd 9f STA $9fcd ; (si + 7)
0c4c : a9 20 __ LDA #$20
0c4e : 8d c6 9f STA $9fc6 ; (si + 0)
0c51 : a9 ff __ LDA #$ff
0c53 : 8d c8 9f STA $9fc8 ; (si + 2)
.l25:
0c56 : a0 00 __ LDY #$00
0c58 : b1 4b __ LDA (T2 + 0),y 
0c5a : aa __ __ TAX
0c5b : e6 4b __ INC T2 + 0 
0c5d : d0 02 __ BNE $0c61 ; (printf.s1318 + 0)
.s1317:
0c5f : e6 4c __ INC T2 + 1 
.s1318:
0c61 : 8a __ __ TXA
0c62 : e0 2b __ CPX #$2b
0c64 : d0 07 __ BNE $0c6d ; (printf.s28 + 0)
.s27:
0c66 : a9 01 __ LDA #$01
0c68 : 8d cb 9f STA $9fcb ; (si + 5)
0c6b : d0 e9 __ BNE $0c56 ; (printf.l25 + 0)
.s28:
0c6d : c9 30 __ CMP #$30
0c6f : d0 06 __ BNE $0c77 ; (printf.s30 + 0)
.s29:
0c71 : 8d c6 9f STA $9fc6 ; (si + 0)
0c74 : 4c 56 0c JMP $0c56 ; (printf.l25 + 0)
.s30:
0c77 : c9 23 __ CMP #$23
0c79 : d0 07 __ BNE $0c82 ; (printf.s32 + 0)
.s31:
0c7b : a9 01 __ LDA #$01
0c7d : 8d cd 9f STA $9fcd ; (si + 7)
0c80 : d0 d4 __ BNE $0c56 ; (printf.l25 + 0)
.s32:
0c82 : c9 2d __ CMP #$2d
0c84 : d0 07 __ BNE $0c8d ; (printf.s26 + 0)
.s33:
0c86 : a9 01 __ LDA #$01
0c88 : 8d cc 9f STA $9fcc ; (si + 6)
0c8b : d0 c9 __ BNE $0c56 ; (printf.l25 + 0)
.s26:
0c8d : 85 54 __ STA T7 + 0 
0c8f : c9 30 __ CMP #$30
0c91 : 90 2d __ BCC $0cc0 ; (printf.s35 + 0)
.s36:
0c93 : c9 3a __ CMP #$3a
0c95 : b0 29 __ BCS $0cc0 ; (printf.s35 + 0)
.s34:
0c97 : 84 4f __ STY T4 + 0 
.l38:
0c99 : a5 4f __ LDA T4 + 0 
0c9b : 0a __ __ ASL
0c9c : 0a __ __ ASL
0c9d : 18 __ __ CLC
0c9e : 65 4f __ ADC T4 + 0 
0ca0 : 0a __ __ ASL
0ca1 : 18 __ __ CLC
0ca2 : 65 54 __ ADC T7 + 0 
0ca4 : 38 __ __ SEC
0ca5 : e9 30 __ SBC #$30
0ca7 : 85 4f __ STA T4 + 0 
0ca9 : b1 4b __ LDA (T2 + 0),y 
0cab : 85 54 __ STA T7 + 0 
0cad : e6 4b __ INC T2 + 0 
0caf : d0 02 __ BNE $0cb3 ; (printf.s1350 + 0)
.s1349:
0cb1 : e6 4c __ INC T2 + 1 
.s1350:
0cb3 : c9 30 __ CMP #$30
0cb5 : 90 04 __ BCC $0cbb ; (printf.s39 + 0)
.s40:
0cb7 : c9 3a __ CMP #$3a
0cb9 : 90 de __ BCC $0c99 ; (printf.l38 + 0)
.s39:
0cbb : a6 4f __ LDX T4 + 0 
0cbd : 8e c7 9f STX $9fc7 ; (si + 1)
.s35:
0cc0 : c9 2e __ CMP #$2e
0cc2 : d0 2a __ BNE $0cee ; (printf.s42 + 0)
.s41:
0cc4 : 98 __ __ TYA
0cc5 : f0 0e __ BEQ $0cd5 ; (printf.l2656 + 0)
.s44:
0cc7 : a5 43 __ LDA T0 + 0 
0cc9 : 0a __ __ ASL
0cca : 0a __ __ ASL
0ccb : 18 __ __ CLC
0ccc : 65 43 __ ADC T0 + 0 
0cce : 0a __ __ ASL
0ccf : 18 __ __ CLC
0cd0 : 65 54 __ ADC T7 + 0 
0cd2 : 38 __ __ SEC
0cd3 : e9 30 __ SBC #$30
.l2656:
0cd5 : 85 43 __ STA T0 + 0 
0cd7 : b1 4b __ LDA (T2 + 0),y 
0cd9 : 85 54 __ STA T7 + 0 
0cdb : e6 4b __ INC T2 + 0 
0cdd : d0 02 __ BNE $0ce1 ; (printf.s1320 + 0)
.s1319:
0cdf : e6 4c __ INC T2 + 1 
.s1320:
0ce1 : c9 30 __ CMP #$30
0ce3 : 90 04 __ BCC $0ce9 ; (printf.s45 + 0)
.s46:
0ce5 : c9 3a __ CMP #$3a
0ce7 : 90 de __ BCC $0cc7 ; (printf.s44 + 0)
.s45:
0ce9 : a6 43 __ LDX T0 + 0 
0ceb : 8e c8 9f STX $9fc8 ; (si + 2)
.s42:
0cee : c9 64 __ CMP #$64
0cf0 : d0 03 __ BNE $0cf5 ; (printf.s51 + 0)
0cf2 : 4c 84 17 JMP $1784 ; (printf.s47 + 0)
.s51:
0cf5 : c9 44 __ CMP #$44
0cf7 : f0 f9 __ BEQ $0cf2 ; (printf.s42 + 4)
.s50:
0cf9 : c9 69 __ CMP #$69
0cfb : f0 f5 __ BEQ $0cf2 ; (printf.s42 + 4)
.s49:
0cfd : c9 49 __ CMP #$49
0cff : f0 f1 __ BEQ $0cf2 ; (printf.s42 + 4)
.s48:
0d01 : c9 75 __ CMP #$75
0d03 : d0 03 __ BNE $0d08 ; (printf.s79 + 0)
0d05 : 4c c2 16 JMP $16c2 ; (printf.s77 + 0)
.s79:
0d08 : c9 55 __ CMP #$55
0d0a : f0 f9 __ BEQ $0d05 ; (printf.s48 + 4)
.s78:
0d0c : c9 78 __ CMP #$78
0d0e : d0 03 __ BNE $0d13 ; (printf.s107 + 0)
0d10 : 4c e0 15 JMP $15e0 ; (printf.s105 + 0)
.s107:
0d13 : c9 58 __ CMP #$58
0d15 : f0 f9 __ BEQ $0d10 ; (printf.s78 + 4)
.s106:
0d17 : c9 6c __ CMP #$6c
0d19 : d0 03 __ BNE $0d1e ; (printf.s135 + 0)
0d1b : 4c b9 12 JMP $12b9 ; (printf.s133 + 0)
.s135:
0d1e : c9 4c __ CMP #$4c
0d20 : f0 f9 __ BEQ $0d1b ; (printf.s106 + 4)
.s134:
0d22 : c9 66 __ CMP #$66
0d24 : d0 03 __ BNE $0d29 ; (printf.s225 + 0)
0d26 : 4c 65 0e JMP $0e65 ; (printf.s219 + 0)
.s225:
0d29 : c9 67 __ CMP #$67
0d2b : f0 f9 __ BEQ $0d26 ; (printf.s134 + 4)
.s224:
0d2d : c9 65 __ CMP #$65
0d2f : f0 f5 __ BEQ $0d26 ; (printf.s134 + 4)
.s223:
0d31 : c9 46 __ CMP #$46
0d33 : f0 f1 __ BEQ $0d26 ; (printf.s134 + 4)
.s222:
0d35 : c9 47 __ CMP #$47
0d37 : f0 ed __ BEQ $0d26 ; (printf.s134 + 4)
.s221:
0d39 : c9 45 __ CMP #$45
0d3b : f0 e9 __ BEQ $0d26 ; (printf.s134 + 4)
.s220:
0d3d : c9 73 __ CMP #$73
0d3f : f0 2b __ BEQ $0d6c ; (printf.s283 + 0)
.s285:
0d41 : c9 53 __ CMP #$53
0d43 : f0 27 __ BEQ $0d6c ; (printf.s283 + 0)
.s284:
0d45 : c9 63 __ CMP #$63
0d47 : f0 12 __ BEQ $0d5b ; (printf.s328 + 0)
.s330:
0d49 : c9 43 __ CMP #$43
0d4b : f0 0e __ BEQ $0d5b ; (printf.s328 + 0)
.s329:
0d4d : aa __ __ TAX
0d4e : d0 03 __ BNE $0d53 ; (printf.s331 + 0)
0d50 : 4c e8 0b JMP $0be8 ; (printf.l2 + 0)
.s331:
0d53 : 8d ce 9f STA $9fce ; (buff + 0)
.s2785:
0d56 : a9 01 __ LDA #$01
0d58 : 4c e6 0b JMP $0be6 ; (printf.l1092 + 0)
.s328:
0d5b : b1 4d __ LDA (T3 + 0),y 
0d5d : 8d ce 9f STA $9fce ; (buff + 0)
0d60 : a5 4d __ LDA T3 + 0 
0d62 : 69 01 __ ADC #$01
0d64 : 85 4d __ STA T3 + 0 
0d66 : 90 ee __ BCC $0d56 ; (printf.s2785 + 0)
.s1347:
0d68 : e6 4e __ INC T3 + 1 
0d6a : b0 ea __ BCS $0d56 ; (printf.s2785 + 0)
.s283:
0d6c : b1 4d __ LDA (T3 + 0),y 
0d6e : 85 43 __ STA T0 + 0 
0d70 : a0 01 __ LDY #$01
0d72 : b1 4d __ LDA (T3 + 0),y 
0d74 : 85 44 __ STA T0 + 1 
0d76 : a5 4d __ LDA T3 + 0 
0d78 : 69 01 __ ADC #$01
0d7a : 85 4d __ STA T3 + 0 
0d7c : 90 02 __ BCC $0d80 ; (printf.s1344 + 0)
.s1343:
0d7e : e6 4e __ INC T3 + 1 
.s1344:
0d80 : a2 00 __ LDX #$00
0d82 : 86 51 __ STX T5 + 0 
0d84 : ad c7 9f LDA $9fc7 ; (si + 1)
0d87 : f0 0d __ BEQ $0d96 ; (printf.s286 + 0)
.s1216:
0d89 : a0 00 __ LDY #$00
0d8b : b1 43 __ LDA (T0 + 0),y 
0d8d : f0 05 __ BEQ $0d94 ; (printf.s1217 + 0)
.l288:
0d8f : c8 __ __ INY
0d90 : b1 43 __ LDA (T0 + 0),y 
0d92 : d0 fb __ BNE $0d8f ; (printf.l288 + 0)
.s1217:
0d94 : 84 51 __ STY T5 + 0 
.s286:
0d96 : ad cc 9f LDA $9fcc ; (si + 6)
0d99 : d0 5b __ BNE $0df6 ; (printf.s670 + 0)
.s672:
0d9b : a4 51 __ LDY T5 + 0 
0d9d : cc c7 9f CPY $9fc7 ; (si + 1)
0da0 : b0 54 __ BCS $0df6 ; (printf.s670 + 0)
.s1103:
0da2 : ad c6 9f LDA $9fc6 ; (si + 0)
.l1081:
0da5 : 9d ce 9f STA $9fce,x ; (buff + 0)
0da8 : e8 __ __ INX
0da9 : c8 __ __ INY
0daa : cc c7 9f CPY $9fc7 ; (si + 1)
0dad : 90 f6 __ BCC $0da5 ; (printf.l1081 + 0)
.s1078:
0daf : 86 47 __ STX T1 + 0 
0db1 : 84 51 __ STY T5 + 0 
0db3 : 8a __ __ TXA
0db4 : f0 40 __ BEQ $0df6 ; (printf.s670 + 0)
.s293:
0db6 : a9 00 __ LDA #$00
0db8 : 9d ce 9f STA $9fce,x ; (buff + 0)
0dbb : ad ce 9f LDA $9fce ; (buff + 0)
0dbe : f0 34 __ BEQ $0df4 ; (printf.s295 + 0)
.s1895:
0dc0 : aa __ __ TAX
0dc1 : a9 01 __ LDA #$01
0dc3 : 85 4f __ STA T4 + 0 
.l297:
0dc5 : 8a __ __ TXA
0dc6 : e0 0a __ CPX #$0a
0dc8 : d0 08 __ BNE $0dd2 ; (printf.s301 + 0)
.s300:
0dca : a9 0d __ LDA #$0d
.s1088:
0dcc : 20 d2 ff JSR $ffd2 
0dcf : 4c e9 0d JMP $0de9 ; (printf.s296 + 0)
.s301:
0dd2 : c9 09 __ CMP #$09
0dd4 : d0 f6 __ BNE $0dcc ; (printf.s1088 + 0)
.s302:
0dd6 : a5 d3 __ LDA $d3 
0dd8 : 29 03 __ AND #$03
0dda : 85 47 __ STA T1 + 0 
.l304:
0ddc : a9 20 __ LDA #$20
0dde : 20 d2 ff JSR $ffd2 
0de1 : e6 47 __ INC T1 + 0 
0de3 : a5 47 __ LDA T1 + 0 
0de5 : c9 04 __ CMP #$04
0de7 : 90 f3 __ BCC $0ddc ; (printf.l304 + 0)
.s296:
0de9 : a6 4f __ LDX T4 + 0 
0deb : bd ce 9f LDA $9fce,x ; (buff + 0)
0dee : e6 4f __ INC T4 + 0 
0df0 : aa __ __ TAX
0df1 : a8 __ __ TAY
0df2 : d0 d1 __ BNE $0dc5 ; (printf.l297 + 0)
.s295:
0df4 : 85 47 __ STA T1 + 0 
.s670:
0df6 : 18 __ __ CLC
0df7 : a5 43 __ LDA T0 + 0 
0df9 : 69 01 __ ADC #$01
0dfb : 85 4f __ STA T4 + 0 
0dfd : a5 44 __ LDA T0 + 1 
0dff : 69 00 __ ADC #$00
0e01 : 85 50 __ STA T4 + 1 
0e03 : a0 00 __ LDY #$00
0e05 : b1 43 __ LDA (T0 + 0),y 
0e07 : 85 43 __ STA T0 + 0 
0e09 : f0 37 __ BEQ $0e42 ; (printf.s292 + 0)
.l312:
0e0b : c9 0a __ CMP #$0a
0e0d : d0 08 __ BNE $0e17 ; (printf.s316 + 0)
.s315:
0e0f : a9 0d __ LDA #$0d
.s1087:
0e11 : 20 d2 ff JSR $ffd2 
0e14 : 4c 33 0e JMP $0e33 ; (printf.s311 + 0)
.s316:
0e17 : c9 09 __ CMP #$09
0e19 : f0 05 __ BEQ $0e20 ; (printf.s317 + 0)
.s4318:
0e1b : a5 43 __ LDA T0 + 0 
0e1d : 4c 11 0e JMP $0e11 ; (printf.s1087 + 0)
.s317:
0e20 : a5 d3 __ LDA $d3 
0e22 : 29 03 __ AND #$03
0e24 : 85 43 __ STA T0 + 0 
.l319:
0e26 : a9 20 __ LDA #$20
0e28 : 20 d2 ff JSR $ffd2 
0e2b : e6 43 __ INC T0 + 0 
0e2d : a5 43 __ LDA T0 + 0 
0e2f : c9 04 __ CMP #$04
0e31 : 90 f3 __ BCC $0e26 ; (printf.l319 + 0)
.s311:
0e33 : a0 00 __ LDY #$00
0e35 : b1 4f __ LDA (T4 + 0),y 
0e37 : 85 43 __ STA T0 + 0 
0e39 : e6 4f __ INC T4 + 0 
0e3b : d0 02 __ BNE $0e3f ; (printf.s1346 + 0)
.s1345:
0e3d : e6 50 __ INC T4 + 1 
.s1346:
0e3f : aa __ __ TAX
0e40 : d0 c9 __ BNE $0e0b ; (printf.l312 + 0)
.s292:
0e42 : ad cc 9f LDA $9fcc ; (si + 6)
0e45 : d0 03 __ BNE $0e4a ; (printf.s669 + 0)
0e47 : 4c e8 0b JMP $0be8 ; (printf.l2 + 0)
.s669:
0e4a : a4 51 __ LDY T5 + 0 
0e4c : cc c7 9f CPY $9fc7 ; (si + 1)
0e4f : b0 f6 __ BCS $0e47 ; (printf.s292 + 5)
.s1098:
0e51 : ad c6 9f LDA $9fc6 ; (si + 0)
0e54 : a6 47 __ LDX T1 + 0 
.l1079:
0e56 : 9d ce 9f STA $9fce,x ; (buff + 0)
0e59 : e8 __ __ INX
0e5a : c8 __ __ INY
0e5b : cc c7 9f CPY $9fc7 ; (si + 1)
0e5e : 90 f6 __ BCC $0e56 ; (printf.l1079 + 0)
.s1076:
0e60 : 86 47 __ STX T1 + 0 
0e62 : 4c e8 0b JMP $0be8 ; (printf.l2 + 0)
.s219:
0e65 : b1 4d __ LDA (T3 + 0),y 
0e67 : 85 43 __ STA T0 + 0 
0e69 : a0 01 __ LDY #$01
0e6b : b1 4d __ LDA (T3 + 0),y 
0e6d : 85 44 __ STA T0 + 1 
0e6f : c8 __ __ INY
0e70 : b1 4d __ LDA (T3 + 0),y 
0e72 : 85 45 __ STA T0 + 2 
0e74 : c8 __ __ INY
0e75 : b1 4d __ LDA (T3 + 0),y 
0e77 : 85 46 __ STA T0 + 3 
0e79 : 29 7f __ AND #$7f
0e7b : 05 45 __ ORA T0 + 2 
0e7d : 05 44 __ ORA T0 + 1 
0e7f : 05 43 __ ORA T0 + 0 
0e81 : f0 13 __ BEQ $0e96 ; (printf.s228 + 0)
.s1074:
0e83 : 24 46 __ BIT T0 + 3 
0e85 : 10 0f __ BPL $0e96 ; (printf.s228 + 0)
.s227:
0e87 : a5 46 __ LDA T0 + 3 
0e89 : 49 80 __ EOR #$80
0e8b : 85 46 __ STA T0 + 3 
0e8d : a9 2d __ LDA #$2d
.s2786:
0e8f : 8d ce 9f STA $9fce ; (buff + 0)
0e92 : a9 01 __ LDA #$01
0e94 : d0 09 __ BNE $0e9f ; (printf.s229 + 0)
.s228:
0e96 : ad cb 9f LDA $9fcb ; (si + 5)
0e99 : f0 04 __ BEQ $0e9f ; (printf.s229 + 0)
.s230:
0e9b : a9 2b __ LDA #$2b
0e9d : d0 f0 __ BNE $0e8f ; (printf.s2786 + 0)
.s229:
0e9f : 85 56 __ STA T9 + 0 
0ea1 : a5 45 __ LDA T0 + 2 
0ea3 : 0a __ __ ASL
0ea4 : a5 46 __ LDA T0 + 3 
0ea6 : 2a __ __ ROL
0ea7 : c9 ff __ CMP #$ff
0ea9 : d0 17 __ BNE $0ec2 ; (printf.s232 + 0)
.s231:
0eab : a9 49 __ LDA #$49
0ead : a6 56 __ LDX T9 + 0 
0eaf : 9d ce 9f STA $9fce,x ; (buff + 0)
0eb2 : a9 4e __ LDA #$4e
0eb4 : 9d cf 9f STA $9fcf,x ; (buff + 1)
0eb7 : a9 46 __ LDA #$46
0eb9 : 9d d0 9f STA $9fd0,x ; (buff + 2)
0ebc : 8a __ __ TXA
0ebd : 69 02 __ ADC #$02
0ebf : 4c d9 10 JMP $10d9 ; (printf.s1099 + 0)
.s232:
0ec2 : ad c8 9f LDA $9fc8 ; (si + 2)
0ec5 : c9 ff __ CMP #$ff
0ec7 : d0 02 __ BNE $0ecb ; (printf.s1573 + 0)
.s1574:
0ec9 : a9 06 __ LDA #$06
.s1573:
0ecb : 85 4f __ STA T4 + 0 
0ecd : 85 55 __ STA T8 + 0 
0ecf : a9 00 __ LDA #$00
0ed1 : 85 51 __ STA T5 + 0 
0ed3 : 85 52 __ STA T5 + 1 
0ed5 : a5 46 __ LDA T0 + 3 
0ed7 : 29 7f __ AND #$7f
0ed9 : 05 45 __ ORA T0 + 2 
0edb : 05 44 __ ORA T0 + 1 
0edd : 05 43 __ ORA T0 + 0 
0edf : f0 03 __ BEQ $0ee4 ; (printf.s234 + 0)
0ee1 : 4c b8 11 JMP $11b8 ; (printf.s409 + 0)
.s234:
0ee4 : a5 54 __ LDA T7 + 0 
0ee6 : c9 65 __ CMP #$65
0ee8 : d0 04 __ BNE $0eee ; (printf.s1030 + 0)
.s1029:
0eea : a9 01 __ LDA #$01
0eec : d0 02 __ BNE $0ef0 ; (printf.s1031 + 0)
.s1030:
0eee : a9 00 __ LDA #$00
.s1031:
0ef0 : 85 57 __ STA T10 + 0 
0ef2 : a6 4f __ LDX T4 + 0 
0ef4 : e8 __ __ INX
0ef5 : 86 53 __ STX T6 + 0 
0ef7 : a5 54 __ LDA T7 + 0 
0ef9 : c9 67 __ CMP #$67
0efb : d0 13 __ BNE $0f10 ; (printf.s242 + 0)
.s241:
0efd : a5 52 __ LDA T5 + 1 
0eff : 30 08 __ BMI $0f09 ; (printf.s243 + 0)
.s1049:
0f01 : d0 06 __ BNE $0f09 ; (printf.s243 + 0)
.s1048:
0f03 : a5 51 __ LDA T5 + 0 
0f05 : c9 04 __ CMP #$04
0f07 : 90 07 __ BCC $0f10 ; (printf.s242 + 0)
.s243:
0f09 : a9 01 __ LDA #$01
0f0b : 85 57 __ STA T10 + 0 
0f0d : 4c 4b 11 JMP $114b ; (printf.s245 + 0)
.s242:
0f10 : a5 57 __ LDA T10 + 0 
0f12 : d0 f9 __ BNE $0f0d ; (printf.s243 + 4)
.s406:
0f14 : 24 52 __ BIT T5 + 1 
0f16 : 10 3b __ BPL $0f53 ; (printf.s249 + 0)
.s248:
0f18 : a5 43 __ LDA T0 + 0 
0f1a : 85 1b __ STA ACCU + 0 
0f1c : a5 44 __ LDA T0 + 1 
0f1e : 85 1c __ STA ACCU + 1 
0f20 : a5 45 __ LDA T0 + 2 
0f22 : 85 1d __ STA ACCU + 2 
0f24 : a5 46 __ LDA T0 + 3 
0f26 : 85 1e __ STA ACCU + 3 
.l1303:
0f28 : a9 00 __ LDA #$00
0f2a : 85 03 __ STA WORK + 0 
0f2c : 85 04 __ STA WORK + 1 
0f2e : 20 84 1e JSR $1e84 ; (freg@proxy + 0)
0f31 : 20 25 1b JSR $1b25 ; (crt_fdiv + 0)
0f34 : 18 __ __ CLC
0f35 : a5 51 __ LDA T5 + 0 
0f37 : 69 01 __ ADC #$01
0f39 : 85 51 __ STA T5 + 0 
0f3b : a5 52 __ LDA T5 + 1 
0f3d : 69 00 __ ADC #$00
0f3f : 85 52 __ STA T5 + 1 
0f41 : 30 e5 __ BMI $0f28 ; (printf.l1303 + 0)
.s1304:
0f43 : a5 1e __ LDA ACCU + 3 
0f45 : 85 46 __ STA T0 + 3 
0f47 : a5 1d __ LDA ACCU + 2 
0f49 : 85 45 __ STA T0 + 2 
0f4b : a5 1c __ LDA ACCU + 1 
0f4d : 85 44 __ STA T0 + 1 
0f4f : a5 1b __ LDA ACCU + 0 
0f51 : 85 43 __ STA T0 + 0 
.s249:
0f53 : 18 __ __ CLC
0f54 : a5 4f __ LDA T4 + 0 
0f56 : 65 51 __ ADC T5 + 0 
0f58 : 18 __ __ CLC
0f59 : 69 01 __ ADC #$01
0f5b : 85 53 __ STA T6 + 0 
0f5d : c9 07 __ CMP #$07
0f5f : 90 14 __ BCC $0f75 ; (printf.s250 + 0)
.s251:
0f61 : ad c2 1e LDA $1ec2 ; (fround5 + 24)
0f64 : 85 47 __ STA T1 + 0 
0f66 : ad c3 1e LDA $1ec3 ; (fround5 + 25)
0f69 : 85 48 __ STA T1 + 1 
0f6b : ad c4 1e LDA $1ec4 ; (fround5 + 26)
0f6e : 85 49 __ STA T1 + 2 
0f70 : ad c5 1e LDA $1ec5 ; (fround5 + 27)
0f73 : b0 15 __ BCS $0f8a ; (printf.s2764 + 0)
.s250:
0f75 : 0a __ __ ASL
0f76 : 0a __ __ ASL
0f77 : aa __ __ TAX
0f78 : bd a6 1e LDA $1ea6,x ; (divmod32@proxy + 4)
0f7b : 85 47 __ STA T1 + 0 
0f7d : bd a7 1e LDA $1ea7,x ; (divmod32@proxy + 5)
0f80 : 85 48 __ STA T1 + 1 
0f82 : bd a8 1e LDA $1ea8,x ; (divmod32@proxy + 6)
0f85 : 85 49 __ STA T1 + 2 
0f87 : bd a9 1e LDA $1ea9,x ; (spentry + 0)
.s2764:
0f8a : 85 4a __ STA T1 + 3 
0f8c : a2 47 __ LDX #$47
0f8e : 20 8f 1e JSR $1e8f ; (freg@proxy + 0)
0f91 : 20 76 19 JSR $1976 ; (faddsub + 6)
0f94 : a5 1b __ LDA ACCU + 0 
0f96 : 85 43 __ STA T0 + 0 
0f98 : a5 1c __ LDA ACCU + 1 
0f9a : 85 44 __ STA T0 + 1 
0f9c : a6 1d __ LDX ACCU + 2 
0f9e : 86 45 __ STX T0 + 2 
0fa0 : a5 1e __ LDA ACCU + 3 
0fa2 : 85 46 __ STA T0 + 3 
0fa4 : 30 34 __ BMI $0fda ; (printf.s246 + 0)
.s1043:
0fa6 : c9 41 __ CMP #$41
0fa8 : d0 0d __ BNE $0fb7 ; (printf.s1047 + 0)
.s1044:
0faa : e0 20 __ CPX #$20
0fac : d0 09 __ BNE $0fb7 ; (printf.s1047 + 0)
.s1045:
0fae : a5 1c __ LDA ACCU + 1 
0fb0 : 38 __ __ SEC
0fb1 : d0 04 __ BNE $0fb7 ; (printf.s1047 + 0)
.s1046:
0fb3 : a5 1b __ LDA ACCU + 0 
0fb5 : f0 02 __ BEQ $0fb9 ; (printf.s252 + 0)
.s1047:
0fb7 : 90 21 __ BCC $0fda ; (printf.s246 + 0)
.s252:
0fb9 : a6 4f __ LDX T4 + 0 
0fbb : ca __ __ DEX
0fbc : 86 55 __ STX T8 + 0 
.s2982:
0fbe : a9 00 __ LDA #$00
0fc0 : 85 03 __ STA WORK + 0 
0fc2 : 85 04 __ STA WORK + 1 
0fc4 : 20 84 1e JSR $1e84 ; (freg@proxy + 0)
0fc7 : 20 25 1b JSR $1b25 ; (crt_fdiv + 0)
0fca : a5 1b __ LDA ACCU + 0 
0fcc : 85 43 __ STA T0 + 0 
0fce : a5 1c __ LDA ACCU + 1 
0fd0 : 85 44 __ STA T0 + 1 
0fd2 : a5 1d __ LDA ACCU + 2 
0fd4 : 85 45 __ STA T0 + 2 
0fd6 : a5 1e __ LDA ACCU + 3 
0fd8 : 85 46 __ STA T0 + 3 
.s246:
0fda : 38 __ __ SEC
0fdb : a5 53 __ LDA T6 + 0 
0fdd : e5 55 __ SBC T8 + 0 
0fdf : 85 4f __ STA T4 + 0 
0fe1 : a9 14 __ LDA #$14
0fe3 : c5 53 __ CMP T6 + 0 
0fe5 : b0 02 __ BCS $0fe9 ; (printf.s257 + 0)
.s256:
0fe7 : 85 53 __ STA T6 + 0 
.s257:
0fe9 : a5 4f __ LDA T4 + 0 
0feb : d0 09 __ BNE $0ff6 ; (printf.s405 + 0)
.s258:
0fed : a9 30 __ LDA #$30
0fef : a6 56 __ LDX T9 + 0 
0ff1 : 9d ce 9f STA $9fce,x ; (buff + 0)
0ff4 : e6 56 __ INC T9 + 0 
.s405:
0ff6 : a9 00 __ LDA #$00
0ff8 : 85 58 __ STA T11 + 0 
0ffa : c5 4f __ CMP T4 + 0 
0ffc : f0 65 __ BEQ $1063 ; (printf.l263 + 0)
.s264:
0ffe : c9 07 __ CMP #$07
1000 : 90 09 __ BCC $100b ; (printf.s266 + 0)
.l265:
1002 : a9 30 __ LDA #$30
1004 : a6 56 __ LDX T9 + 0 
1006 : 9d ce 9f STA $9fce,x ; (buff + 0)
1009 : b0 4a __ BCS $1055 ; (printf.l260 + 0)
.s266:
100b : a5 43 __ LDA T0 + 0 
100d : 85 1b __ STA ACCU + 0 
100f : a5 44 __ LDA T0 + 1 
1011 : 85 1c __ STA ACCU + 1 
1013 : a5 45 __ LDA T0 + 2 
1015 : 85 1d __ STA ACCU + 2 
1017 : a5 46 __ LDA T0 + 3 
1019 : 85 1e __ STA ACCU + 3 
101b : 20 f6 1c JSR $1cf6 ; (f32_to_i16 + 0)
101e : 18 __ __ CLC
101f : a5 1b __ LDA ACCU + 0 
1021 : 69 30 __ ADC #$30
1023 : a6 56 __ LDX T9 + 0 
1025 : 9d ce 9f STA $9fce,x ; (buff + 0)
1028 : 20 44 1d JSR $1d44 ; (sint16_to_float + 0)
102b : a2 43 __ LDX #$43
102d : 20 2f 19 JSR $192f ; (freg + 4)
1030 : a5 1e __ LDA ACCU + 3 
1032 : 49 80 __ EOR #$80
1034 : 85 1e __ STA ACCU + 3 
1036 : 20 76 19 JSR $1976 ; (faddsub + 6)
1039 : a9 00 __ LDA #$00
103b : 85 03 __ STA WORK + 0 
103d : 85 04 __ STA WORK + 1 
103f : 20 84 1e JSR $1e84 ; (freg@proxy + 0)
1042 : 20 5d 1a JSR $1a5d ; (crt_fmul + 0)
1045 : a5 1b __ LDA ACCU + 0 
1047 : 85 43 __ STA T0 + 0 
1049 : a5 1c __ LDA ACCU + 1 
104b : 85 44 __ STA T0 + 1 
104d : a5 1d __ LDA ACCU + 2 
104f : 85 45 __ STA T0 + 2 
1051 : a5 1e __ LDA ACCU + 3 
1053 : 85 46 __ STA T0 + 3 
.l260:
1055 : e6 56 __ INC T9 + 0 
1057 : e6 58 __ INC T11 + 0 
1059 : a5 58 __ LDA T11 + 0 
105b : c5 53 __ CMP T6 + 0 
105d : b0 15 __ BCS $1074 ; (printf.s262 + 0)
.s261:
105f : c5 4f __ CMP T4 + 0 
1061 : d0 9b __ BNE $0ffe ; (printf.s264 + 0)
.l263:
1063 : a9 2e __ LDA #$2e
1065 : a6 56 __ LDX T9 + 0 
1067 : 9d ce 9f STA $9fce,x ; (buff + 0)
106a : e6 56 __ INC T9 + 0 
106c : a5 58 __ LDA T11 + 0 
106e : c9 07 __ CMP #$07
1070 : 90 99 __ BCC $100b ; (printf.s266 + 0)
1072 : b0 8e __ BCS $1002 ; (printf.l265 + 0)
.s262:
1074 : a5 57 __ LDA T10 + 0 
1076 : f0 63 __ BEQ $10db ; (printf.s233 + 0)
.s267:
1078 : a9 45 __ LDA #$45
107a : a6 56 __ LDX T9 + 0 
107c : 9d ce 9f STA $9fce,x ; (buff + 0)
107f : 24 52 __ BIT T5 + 1 
1081 : 30 07 __ BMI $108a ; (printf.s268 + 0)
.s269:
1083 : a9 2b __ LDA #$2b
1085 : 9d cf 9f STA $9fcf,x ; (buff + 1)
1088 : b0 11 __ BCS $109b ; (printf.s270 + 0)
.s268:
108a : a9 2d __ LDA #$2d
108c : 9d cf 9f STA $9fcf,x ; (buff + 1)
108f : a9 00 __ LDA #$00
1091 : e5 51 __ SBC T5 + 0 
1093 : 85 51 __ STA T5 + 0 
1095 : a9 00 __ LDA #$00
1097 : e5 52 __ SBC T5 + 1 
1099 : 85 52 __ STA T5 + 1 
.s270:
109b : a5 51 __ LDA T5 + 0 
109d : 85 1b __ STA ACCU + 0 
109f : a5 52 __ LDA T5 + 1 
10a1 : 85 1c __ STA ACCU + 1 
10a3 : a9 0a __ LDA #$0a
10a5 : 85 03 __ STA WORK + 0 
10a7 : a9 00 __ LDA #$00
10a9 : 85 04 __ STA WORK + 1 
10ab : 20 d3 1b JSR $1bd3 ; (divs16 + 0)
10ae : 18 __ __ CLC
10af : a5 1b __ LDA ACCU + 0 
10b1 : 69 30 __ ADC #$30
10b3 : a6 56 __ LDX T9 + 0 
10b5 : 9d d0 9f STA $9fd0,x ; (buff + 2)
10b8 : a5 51 __ LDA T5 + 0 
10ba : 85 1b __ STA ACCU + 0 
10bc : a5 52 __ LDA T5 + 1 
10be : 85 1c __ STA ACCU + 1 
10c0 : a9 0a __ LDA #$0a
10c2 : 85 03 __ STA WORK + 0 
10c4 : a9 00 __ LDA #$00
10c6 : 85 04 __ STA WORK + 1 
10c8 : 20 9f 1c JSR $1c9f ; (mods16 + 0)
10cb : 18 __ __ CLC
10cc : a5 05 __ LDA WORK + 2 
10ce : 69 30 __ ADC #$30
10d0 : a6 56 __ LDX T9 + 0 
10d2 : 9d d1 9f STA $9fd1,x ; (buff + 3)
10d5 : 8a __ __ TXA
10d6 : 18 __ __ CLC
10d7 : 69 04 __ ADC #$04
.s1099:
10d9 : 85 56 __ STA T9 + 0 
.s233:
10db : ad c7 9f LDA $9fc7 ; (si + 1)
10de : 85 53 __ STA T6 + 0 
10e0 : a5 56 __ LDA T9 + 0 
10e2 : c5 53 __ CMP T6 + 0 
10e4 : b0 44 __ BCS $112a ; (printf.s226 + 0)
.s271:
10e6 : ad cc 9f LDA $9fcc ; (si + 6)
10e9 : d0 52 __ BNE $113d ; (printf.s277 + 0)
.s274:
10eb : a9 01 __ LDA #$01
10ed : 85 54 __ STA T7 + 0 
10ef : 85 4f __ STA T4 + 0 
10f1 : a5 56 __ LDA T9 + 0 
10f3 : 38 __ __ SEC
.l1279:
10f4 : e5 4f __ SBC T4 + 0 
10f6 : aa __ __ TAX
10f7 : 38 __ __ SEC
10f8 : a5 53 __ LDA T6 + 0 
10fa : e5 4f __ SBC T4 + 0 
10fc : a8 __ __ TAY
10fd : bd ce 9f LDA $9fce,x ; (buff + 0)
1100 : 99 ce 9f STA $9fce,y ; (buff + 0)
1103 : e6 4f __ INC T4 + 0 
1105 : e6 54 __ INC T7 + 0 
1107 : a5 56 __ LDA T9 + 0 
1109 : c5 54 __ CMP T7 + 0 
110b : b0 e7 __ BCS $10f4 ; (printf.l1279 + 0)
.s280:
110d : 38 __ __ SEC
110e : a5 53 __ LDA T6 + 0 
1110 : e5 56 __ SBC T9 + 0 
1112 : 85 43 __ STA T0 + 0 
1114 : a9 00 __ LDA #$00
1116 : e9 00 __ SBC #$00
1118 : 05 43 __ ORA T0 + 0 
111a : f0 0c __ BEQ $1128 ; (printf.s275 + 0)
.s1091:
111c : a9 20 __ LDA #$20
111e : a2 00 __ LDX #$00
.l1165:
1120 : 9d ce 9f STA $9fce,x ; (buff + 0)
1123 : e8 __ __ INX
1124 : e4 43 __ CPX T0 + 0 
1126 : 90 f8 __ BCC $1120 ; (printf.l1165 + 0)
.s275:
1128 : a5 53 __ LDA T6 + 0 
.s226:
112a : 85 47 __ STA T1 + 0 
112c : 18 __ __ CLC
112d : a5 4d __ LDA T3 + 0 
112f : 69 04 __ ADC #$04
1131 : 85 4d __ STA T3 + 0 
1133 : b0 03 __ BCS $1138 ; (printf.s1333 + 0)
1135 : 4c e8 0b JMP $0be8 ; (printf.l2 + 0)
.s1333:
1138 : e6 4e __ INC T3 + 1 
113a : 4c e8 0b JMP $0be8 ; (printf.l2 + 0)
.s277:
113d : a9 20 __ LDA #$20
113f : a6 56 __ LDX T9 + 0 
.l1083:
1141 : 9d ce 9f STA $9fce,x ; (buff + 0)
1144 : e8 __ __ INX
1145 : e4 53 __ CPX T6 + 0 
1147 : 90 f8 __ BCC $1141 ; (printf.l1083 + 0)
1149 : b0 dd __ BCS $1128 ; (printf.s275 + 0)
.s245:
114b : a5 53 __ LDA T6 + 0 
114d : c9 07 __ CMP #$07
114f : 90 14 __ BCC $1165 ; (printf.s253 + 0)
.s254:
1151 : ad c2 1e LDA $1ec2 ; (fround5 + 24)
1154 : 85 47 __ STA T1 + 0 
1156 : ad c3 1e LDA $1ec3 ; (fround5 + 25)
1159 : 85 48 __ STA T1 + 1 
115b : ad c4 1e LDA $1ec4 ; (fround5 + 26)
115e : 85 49 __ STA T1 + 2 
1160 : ad c5 1e LDA $1ec5 ; (fround5 + 27)
1163 : b0 15 __ BCS $117a ; (printf.s2756 + 0)
.s253:
1165 : 0a __ __ ASL
1166 : 0a __ __ ASL
1167 : aa __ __ TAX
1168 : bd a6 1e LDA $1ea6,x ; (divmod32@proxy + 4)
116b : 85 47 __ STA T1 + 0 
116d : bd a7 1e LDA $1ea7,x ; (divmod32@proxy + 5)
1170 : 85 48 __ STA T1 + 1 
1172 : bd a8 1e LDA $1ea8,x ; (divmod32@proxy + 6)
1175 : 85 49 __ STA T1 + 2 
1177 : bd a9 1e LDA $1ea9,x ; (spentry + 0)
.s2756:
117a : 85 4a __ STA T1 + 3 
117c : a2 47 __ LDX #$47
117e : 20 8f 1e JSR $1e8f ; (freg@proxy + 0)
1181 : 20 76 19 JSR $1976 ; (faddsub + 6)
1184 : a5 1b __ LDA ACCU + 0 
1186 : 85 43 __ STA T0 + 0 
1188 : a5 1c __ LDA ACCU + 1 
118a : 85 44 __ STA T0 + 1 
118c : a6 1d __ LDX ACCU + 2 
118e : 86 45 __ STX T0 + 2 
1190 : a5 1e __ LDA ACCU + 3 
1192 : 85 46 __ STA T0 + 3 
1194 : 10 03 __ BPL $1199 ; (printf.s1035 + 0)
1196 : 4c da 0f JMP $0fda ; (printf.s246 + 0)
.s1035:
1199 : c9 41 __ CMP #$41
119b : d0 0d __ BNE $11aa ; (printf.s1039 + 0)
.s1036:
119d : e0 20 __ CPX #$20
119f : d0 09 __ BNE $11aa ; (printf.s1039 + 0)
.s1037:
11a1 : a5 1c __ LDA ACCU + 1 
11a3 : 38 __ __ SEC
11a4 : d0 04 __ BNE $11aa ; (printf.s1039 + 0)
.s1038:
11a6 : a5 1b __ LDA ACCU + 0 
11a8 : f0 02 __ BEQ $11ac ; (printf.s255 + 0)
.s1039:
11aa : 90 ea __ BCC $1196 ; (printf.s2756 + 28)
.s255:
11ac : e6 51 __ INC T5 + 0 
11ae : f0 03 __ BEQ $11b3 ; (printf.s1339 + 0)
11b0 : 4c be 0f JMP $0fbe ; (printf.s2982 + 0)
.s1339:
11b3 : e6 52 __ INC T5 + 1 
11b5 : 4c be 0f JMP $0fbe ; (printf.s2982 + 0)
.s409:
11b8 : a5 46 __ LDA T0 + 3 
11ba : 10 03 __ BPL $11bf ; (printf.l1069 + 0)
11bc : 4c 41 12 JMP $1241 ; (printf.l238 + 0)
.l1069:
11bf : c9 44 __ CMP #$44
11c1 : d0 11 __ BNE $11d4 ; (printf.s1073 + 0)
.s1070:
11c3 : a5 45 __ LDA T0 + 2 
11c5 : c9 7a __ CMP #$7a
11c7 : d0 0b __ BNE $11d4 ; (printf.s1073 + 0)
.s1071:
11c9 : a5 44 __ LDA T0 + 1 
11cb : d0 07 __ BNE $11d4 ; (printf.s1073 + 0)
.s1072:
11cd : a5 43 __ LDA T0 + 0 
11cf : d0 03 __ BNE $11d4 ; (printf.s1073 + 0)
11d1 : 4c 75 12 JMP $1275 ; (printf.s236 + 0)
.s1073:
11d4 : b0 fb __ BCS $11d1 ; (printf.s1072 + 4)
.s408:
11d6 : a5 46 __ LDA T0 + 3 
11d8 : 30 67 __ BMI $1241 ; (printf.l238 + 0)
.s1061:
11da : c9 3f __ CMP #$3f
11dc : d0 0e __ BNE $11ec ; (printf.s1065 + 0)
.s1062:
11de : a5 45 __ LDA T0 + 2 
11e0 : c9 80 __ CMP #$80
11e2 : d0 08 __ BNE $11ec ; (printf.s1065 + 0)
.s1063:
11e4 : a5 44 __ LDA T0 + 1 
11e6 : d0 04 __ BNE $11ec ; (printf.s1065 + 0)
.s1064:
11e8 : a5 43 __ LDA T0 + 0 
11ea : f0 02 __ BEQ $11ee ; (printf.s407 + 0)
.s1065:
11ec : 90 53 __ BCC $1241 ; (printf.l238 + 0)
.s407:
11ee : a5 46 __ LDA T0 + 3 
11f0 : c9 41 __ CMP #$41
11f2 : d0 0e __ BNE $1202 ; (printf.l1057 + 0)
.s1054:
11f4 : a5 45 __ LDA T0 + 2 
11f6 : c9 20 __ CMP #$20
11f8 : d0 08 __ BNE $1202 ; (printf.l1057 + 0)
.s1055:
11fa : a5 44 __ LDA T0 + 1 
11fc : d0 04 __ BNE $1202 ; (printf.l1057 + 0)
.s1056:
11fe : a5 43 __ LDA T0 + 0 
1200 : f0 05 __ BEQ $1207 ; (printf.l240 + 0)
.l1057:
1202 : b0 03 __ BCS $1207 ; (printf.l240 + 0)
1204 : 4c e4 0e JMP $0ee4 ; (printf.s234 + 0)
.l240:
1207 : e6 51 __ INC T5 + 0 
1209 : d0 02 __ BNE $120d ; (printf.s1338 + 0)
.s1337:
120b : e6 52 __ INC T5 + 1 
.s1338:
120d : a5 43 __ LDA T0 + 0 
120f : 85 1b __ STA ACCU + 0 
1211 : a5 44 __ LDA T0 + 1 
1213 : 85 1c __ STA ACCU + 1 
1215 : a5 45 __ LDA T0 + 2 
1217 : 85 1d __ STA ACCU + 2 
1219 : a5 46 __ LDA T0 + 3 
121b : 85 1e __ STA ACCU + 3 
121d : a9 00 __ LDA #$00
121f : 85 03 __ STA WORK + 0 
1221 : 85 04 __ STA WORK + 1 
1223 : 20 84 1e JSR $1e84 ; (freg@proxy + 0)
1226 : 20 25 1b JSR $1b25 ; (crt_fdiv + 0)
1229 : a5 1b __ LDA ACCU + 0 
122b : 85 43 __ STA T0 + 0 
122d : a5 1c __ LDA ACCU + 1 
122f : 85 44 __ STA T0 + 1 
1231 : a5 1d __ LDA ACCU + 2 
1233 : 85 45 __ STA T0 + 2 
1235 : a5 1e __ LDA ACCU + 3 
1237 : 85 46 __ STA T0 + 3 
1239 : 30 c9 __ BMI $1204 ; (printf.l1057 + 2)
.s1053:
123b : c9 41 __ CMP #$41
123d : d0 c3 __ BNE $1202 ; (printf.l1057 + 0)
123f : f0 b3 __ BEQ $11f4 ; (printf.s1054 + 0)
.l238:
1241 : 38 __ __ SEC
1242 : a5 51 __ LDA T5 + 0 
1244 : e9 03 __ SBC #$03
1246 : 85 51 __ STA T5 + 0 
1248 : b0 02 __ BCS $124c ; (printf.s1336 + 0)
.s1335:
124a : c6 52 __ DEC T5 + 1 
.s1336:
124c : a9 00 __ LDA #$00
124e : 85 1b __ STA ACCU + 0 
1250 : 85 1c __ STA ACCU + 1 
1252 : a9 7a __ LDA #$7a
1254 : 85 1d __ STA ACCU + 2 
1256 : a9 44 __ LDA #$44
1258 : 85 1e __ STA ACCU + 3 
125a : a2 43 __ LDX #$43
125c : 20 2f 19 JSR $192f ; (freg + 4)
125f : 20 5d 1a JSR $1a5d ; (crt_fmul + 0)
1262 : a5 1b __ LDA ACCU + 0 
1264 : 85 43 __ STA T0 + 0 
1266 : a5 1c __ LDA ACCU + 1 
1268 : 85 44 __ STA T0 + 1 
126a : a5 1d __ LDA ACCU + 2 
126c : 85 45 __ STA T0 + 2 
126e : a5 1e __ LDA ACCU + 3 
1270 : 85 46 __ STA T0 + 3 
1272 : 4c d6 11 JMP $11d6 ; (printf.s408 + 0)
.s236:
1275 : 18 __ __ CLC
1276 : a5 51 __ LDA T5 + 0 
1278 : 69 03 __ ADC #$03
127a : 85 51 __ STA T5 + 0 
127c : 90 02 __ BCC $1280 ; (printf.s1342 + 0)
.s1341:
127e : e6 52 __ INC T5 + 1 
.s1342:
1280 : a5 43 __ LDA T0 + 0 
1282 : 85 1b __ STA ACCU + 0 
1284 : a5 44 __ LDA T0 + 1 
1286 : 85 1c __ STA ACCU + 1 
1288 : a5 45 __ LDA T0 + 2 
128a : 85 1d __ STA ACCU + 2 
128c : a5 46 __ LDA T0 + 3 
128e : 85 1e __ STA ACCU + 3 
1290 : a9 00 __ LDA #$00
1292 : 85 03 __ STA WORK + 0 
1294 : 85 04 __ STA WORK + 1 
1296 : a9 7a __ LDA #$7a
1298 : 85 05 __ STA WORK + 2 
129a : a9 44 __ LDA #$44
129c : 85 06 __ STA WORK + 3 
129e : 20 3f 19 JSR $193f ; (freg + 20)
12a1 : 20 25 1b JSR $1b25 ; (crt_fdiv + 0)
12a4 : a5 1b __ LDA ACCU + 0 
12a6 : 85 43 __ STA T0 + 0 
12a8 : a5 1c __ LDA ACCU + 1 
12aa : 85 44 __ STA T0 + 1 
12ac : a5 1d __ LDA ACCU + 2 
12ae : 85 45 __ STA T0 + 2 
12b0 : a5 1e __ LDA ACCU + 3 
12b2 : 85 46 __ STA T0 + 3 
12b4 : 30 8b __ BMI $1241 ; (printf.l238 + 0)
12b6 : 4c bf 11 JMP $11bf ; (printf.l1069 + 0)
.s133:
12b9 : b1 4d __ LDA (T3 + 0),y 
12bb : 85 43 __ STA T0 + 0 
12bd : a0 01 __ LDY #$01
12bf : b1 4d __ LDA (T3 + 0),y 
12c1 : 85 44 __ STA T0 + 1 
12c3 : c8 __ __ INY
12c4 : b1 4d __ LDA (T3 + 0),y 
12c6 : 85 45 __ STA T0 + 2 
12c8 : c8 __ __ INY
12c9 : b1 4d __ LDA (T3 + 0),y 
12cb : 85 46 __ STA T0 + 3 
12cd : a5 4d __ LDA T3 + 0 
12cf : 69 03 __ ADC #$03
12d1 : 85 4d __ STA T3 + 0 
12d3 : 90 02 __ BCC $12d7 ; (printf.s1330 + 0)
.s1329:
12d5 : e6 4e __ INC T3 + 1 
.s1330:
12d7 : a0 00 __ LDY #$00
12d9 : b1 4b __ LDA (T2 + 0),y 
12db : aa __ __ TAX
12dc : e6 4b __ INC T2 + 0 
12de : d0 02 __ BNE $12e2 ; (printf.s1332 + 0)
.s1331:
12e0 : e6 4c __ INC T2 + 1 
.s1332:
12e2 : 8a __ __ TXA
12e3 : e0 64 __ CPX #$64
12e5 : d0 03 __ BNE $12ea ; (printf.s138 + 0)
12e7 : 4c da 14 JMP $14da ; (printf.s136 + 0)
.s138:
12ea : c9 44 __ CMP #$44
12ec : f0 f9 __ BEQ $12e7 ; (printf.s1332 + 5)
.s137:
12ee : c9 75 __ CMP #$75
12f0 : d0 03 __ BNE $12f5 ; (printf.s166 + 0)
12f2 : 4c fd 13 JMP $13fd ; (printf.s164 + 0)
.s166:
12f5 : c9 55 __ CMP #$55
12f7 : f0 f9 __ BEQ $12f2 ; (printf.s137 + 4)
.s165:
12f9 : c9 78 __ CMP #$78
12fb : f0 07 __ BEQ $1304 ; (printf.s192 + 0)
.s193:
12fd : c9 58 __ CMP #$58
12ff : f0 03 __ BEQ $1304 ; (printf.s192 + 0)
1301 : 4c e8 0b JMP $0be8 ; (printf.l2 + 0)
.s192:
1304 : a9 10 __ LDA #$10
1306 : 85 51 __ STA T5 + 0 
1308 : a4 46 __ LDY T0 + 3 
130a : f0 03 __ BEQ $130f ; (printf.s1024 + 0)
130c : 4c d2 13 JMP $13d2 ; (printf.l198 + 0)
.s1024:
130f : a5 45 __ LDA T0 + 2 
1311 : d0 f9 __ BNE $130c ; (printf.s192 + 8)
.s1025:
1313 : a5 44 __ LDA T0 + 1 
1315 : d0 f5 __ BNE $130c ; (printf.s192 + 8)
.s1026:
1317 : c5 43 __ CMP T0 + 0 
1319 : 90 f1 __ BCC $130c ; (printf.s192 + 8)
.s199:
131b : ae c8 9f LDX $9fc8 ; (si + 2)
131e : e8 __ __ INX
131f : d0 04 __ BNE $1325 ; (printf.s1570 + 0)
.s1571:
1321 : a9 0f __ LDA #$0f
1323 : b0 05 __ BCS $132a ; (printf.s1105 + 0)
.s1570:
1325 : a9 10 __ LDA #$10
1327 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1105:
132a : a8 __ __ TAY
132b : c4 51 __ CPY T5 + 0 
132d : b0 0d __ BCS $133c ; (printf.s202 + 0)
.s201:
132f : a9 30 __ LDA #$30
.l1315:
1331 : c6 51 __ DEC T5 + 0 
1333 : a6 51 __ LDX T5 + 0 
1335 : 9d 66 9f STA $9f66,x ; (buffer + 0)
1338 : c4 51 __ CPY T5 + 0 
133a : 90 f5 __ BCC $1331 ; (printf.l1315 + 0)
.s202:
133c : ad cd 9f LDA $9fcd ; (si + 7)
133f : f0 12 __ BEQ $1353 ; (printf.s207 + 0)
.s205:
1341 : a9 58 __ LDA #$58
1343 : a6 51 __ LDX T5 + 0 
1345 : 9d 65 9f STA $9f65,x ; (printf@stack + 8)
1348 : 8a __ __ TXA
1349 : 69 fd __ ADC #$fd
134b : 85 51 __ STA T5 + 0 
134d : aa __ __ TAX
134e : a9 30 __ LDA #$30
1350 : 9d 66 9f STA $9f66,x ; (buffer + 0)
.s207:
1353 : a9 00 __ LDA #$00
1355 : 85 4f __ STA T4 + 0 
1357 : ad cb 9f LDA $9fcb ; (si + 5)
135a : f0 09 __ BEQ $1365 ; (printf.s2736 + 0)
.s209:
135c : c6 51 __ DEC T5 + 0 
135e : a9 2b __ LDA #$2b
1360 : a6 51 __ LDX T5 + 0 
1362 : 9d 66 9f STA $9f66,x ; (buffer + 0)
.s2736:
1365 : ad cc 9f LDA $9fcc ; (si + 6)
1368 : d0 3d __ BNE $13a7 ; (printf.l397 + 0)
.l215:
136a : ad c7 9f LDA $9fc7 ; (si + 1)
136d : 18 __ __ CLC
136e : 65 51 __ ADC T5 + 0 
1370 : 85 43 __ STA T0 + 0 
1372 : a5 51 __ LDA T5 + 0 
1374 : 2a __ __ ROL
1375 : 29 01 __ AND #$01
1377 : e9 00 __ SBC #$00
1379 : f0 06 __ BEQ $1381 ; (printf.s216 + 0)
.s1023:
137b : a9 10 __ LDA #$10
137d : c5 43 __ CMP T0 + 0 
137f : b0 0d __ BCS $138e ; (printf.l398 + 0)
.s216:
1381 : c6 51 __ DEC T5 + 0 
1383 : ad c6 9f LDA $9fc6 ; (si + 0)
1386 : a6 51 __ LDX T5 + 0 
1388 : 9d 66 9f STA $9f66,x ; (buffer + 0)
138b : 4c 6a 13 JMP $136a ; (printf.l215 + 0)
.l398:
138e : a6 51 __ LDX T5 + 0 
1390 : e0 10 __ CPX #$10
1392 : b0 0e __ BCS $13a2 ; (printf.s68 + 0)
.s218:
1394 : bd 66 9f LDA $9f66,x ; (buffer + 0)
1397 : a6 4f __ LDX T4 + 0 
1399 : 9d ce 9f STA $9fce,x ; (buff + 0)
139c : e6 4f __ INC T4 + 0 
139e : e6 51 __ INC T5 + 0 
13a0 : 90 ec __ BCC $138e ; (printf.l398 + 0)
.s68:
13a2 : a5 4f __ LDA T4 + 0 
13a4 : 4c e6 0b JMP $0be6 ; (printf.l1092 + 0)
.l397:
13a7 : a6 51 __ LDX T5 + 0 
13a9 : e0 10 __ CPX #$10
13ab : b0 0e __ BCS $13bb ; (printf.s1170 + 0)
.s212:
13ad : bd 66 9f LDA $9f66,x ; (buffer + 0)
13b0 : a6 4f __ LDX T4 + 0 
13b2 : 9d ce 9f STA $9fce,x ; (buff + 0)
13b5 : e6 4f __ INC T4 + 0 
13b7 : e6 51 __ INC T5 + 0 
13b9 : 90 ec __ BCC $13a7 ; (printf.l397 + 0)
.s1170:
13bb : a6 4f __ LDX T4 + 0 
13bd : ec c7 9f CPX $9fc7 ; (si + 1)
13c0 : b0 0c __ BCS $13ce ; (printf.s1171 + 0)
.l72:
13c2 : ad c6 9f LDA $9fc6 ; (si + 0)
13c5 : 9d ce 9f STA $9fce,x ; (buff + 0)
13c8 : e8 __ __ INX
13c9 : ec c7 9f CPX $9fc7 ; (si + 1)
13cc : 90 f4 __ BCC $13c2 ; (printf.l72 + 0)
.s1171:
13ce : 86 4f __ STX T4 + 0 
13d0 : b0 d0 __ BCS $13a2 ; (printf.s68 + 0)
.l198:
13d2 : a5 43 __ LDA T0 + 0 
13d4 : 29 0f __ AND #$0f
13d6 : 85 47 __ STA T1 + 0 
13d8 : c9 0a __ CMP #$0a
13da : a9 37 __ LDA #$37
13dc : b0 02 __ BCS $13e0 ; (printf.s1569 + 0)
.s1568:
13de : a9 30 __ LDA #$30
.s1569:
13e0 : c6 51 __ DEC T5 + 0 
13e2 : 18 __ __ CLC
13e3 : 65 47 __ ADC T1 + 0 
13e5 : a6 51 __ LDX T5 + 0 
13e7 : 9d 66 9f STA $9f66,x ; (buffer + 0)
13ea : 98 __ __ TYA
13eb : a2 04 __ LDX #$04
.l1021:
13ed : 4a __ __ LSR
13ee : 66 45 __ ROR T0 + 2 
13f0 : 66 44 __ ROR T0 + 1 
13f2 : 66 43 __ ROR T0 + 0 
13f4 : ca __ __ DEX
13f5 : d0 f6 __ BNE $13ed ; (printf.l1021 + 0)
.s1022:
13f7 : a8 __ __ TAY
13f8 : d0 d8 __ BNE $13d2 ; (printf.l198 + 0)
13fa : 4c 0f 13 JMP $130f ; (printf.s1024 + 0)
.s164:
13fd : a9 10 __ LDA #$10
13ff : 85 51 __ STA T5 + 0 
1401 : a5 46 __ LDA T0 + 3 
1403 : f0 03 __ BEQ $1408 ; (printf.s1016 + 0)
1405 : 4c 9e 14 JMP $149e ; (printf.l171 + 0)
.s1016:
1408 : a5 45 __ LDA T0 + 2 
140a : d0 f9 __ BNE $1405 ; (printf.s164 + 8)
.s1017:
140c : a5 44 __ LDA T0 + 1 
140e : d0 f5 __ BNE $1405 ; (printf.s164 + 8)
.s1018:
1410 : c5 43 __ CMP T0 + 0 
1412 : 90 f1 __ BCC $1405 ; (printf.s164 + 8)
.s172:
1414 : ae c8 9f LDX $9fc8 ; (si + 2)
1417 : e8 __ __ INX
1418 : d0 04 __ BNE $141e ; (printf.s1564 + 0)
.s1565:
141a : a9 0f __ LDA #$0f
141c : b0 05 __ BCS $1423 ; (printf.s1104 + 0)
.s1564:
141e : a9 10 __ LDA #$10
1420 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1104:
1423 : a8 __ __ TAY
1424 : c4 51 __ CPY T5 + 0 
1426 : b0 0d __ BCS $1435 ; (printf.s175 + 0)
.s174:
1428 : a9 30 __ LDA #$30
.l1313:
142a : c6 51 __ DEC T5 + 0 
142c : a6 51 __ LDX T5 + 0 
142e : 9d 76 9f STA $9f76,x ; (buffer + 0)
1431 : c4 51 __ CPY T5 + 0 
1433 : 90 f5 __ BCC $142a ; (printf.l1313 + 0)
.s175:
1435 : a9 00 __ LDA #$00
1437 : 85 4f __ STA T4 + 0 
1439 : ad cb 9f LDA $9fcb ; (si + 5)
143c : f0 09 __ BEQ $1447 ; (printf.s2723 + 0)
.s182:
143e : c6 51 __ DEC T5 + 0 
1440 : a9 2b __ LDA #$2b
1442 : a6 51 __ LDX T5 + 0 
1444 : 9d 76 9f STA $9f76,x ; (buffer + 0)
.s2723:
1447 : ad cc 9f LDA $9fcc ; (si + 6)
144a : f0 17 __ BEQ $1463 ; (printf.l188 + 0)
.l391:
144c : a6 51 __ LDX T5 + 0 
144e : e0 10 __ CPX #$10
1450 : 90 03 __ BCC $1455 ; (printf.s185 + 0)
1452 : 4c bb 13 JMP $13bb ; (printf.s1170 + 0)
.s185:
1455 : bd 76 9f LDA $9f76,x ; (buffer + 0)
1458 : a6 4f __ LDX T4 + 0 
145a : 9d ce 9f STA $9fce,x ; (buff + 0)
145d : e6 4f __ INC T4 + 0 
145f : e6 51 __ INC T5 + 0 
1461 : 90 e9 __ BCC $144c ; (printf.l391 + 0)
.l188:
1463 : ad c7 9f LDA $9fc7 ; (si + 1)
1466 : 18 __ __ CLC
1467 : 65 51 __ ADC T5 + 0 
1469 : 85 43 __ STA T0 + 0 
146b : a5 51 __ LDA T5 + 0 
146d : 2a __ __ ROL
146e : 29 01 __ AND #$01
1470 : e9 00 __ SBC #$00
1472 : f0 06 __ BEQ $147a ; (printf.s189 + 0)
.s1015:
1474 : a9 10 __ LDA #$10
1476 : c5 43 __ CMP T0 + 0 
1478 : b0 0d __ BCS $1487 ; (printf.l392 + 0)
.s189:
147a : c6 51 __ DEC T5 + 0 
147c : ad c6 9f LDA $9fc6 ; (si + 0)
147f : a6 51 __ LDX T5 + 0 
1481 : 9d 76 9f STA $9f76,x ; (buffer + 0)
1484 : 4c 63 14 JMP $1463 ; (printf.l188 + 0)
.l392:
1487 : a6 51 __ LDX T5 + 0 
1489 : e0 10 __ CPX #$10
148b : 90 03 __ BCC $1490 ; (printf.s191 + 0)
148d : 4c a2 13 JMP $13a2 ; (printf.s68 + 0)
.s191:
1490 : bd 76 9f LDA $9f76,x ; (buffer + 0)
1493 : a6 4f __ LDX T4 + 0 
1495 : 9d ce 9f STA $9fce,x ; (buff + 0)
1498 : e6 4f __ INC T4 + 0 
149a : e6 51 __ INC T5 + 0 
149c : 90 e9 __ BCC $1487 ; (printf.l392 + 0)
.l171:
149e : a5 43 __ LDA T0 + 0 
14a0 : 85 1b __ STA ACCU + 0 
14a2 : a5 44 __ LDA T0 + 1 
14a4 : 85 1c __ STA ACCU + 1 
14a6 : a5 45 __ LDA T0 + 2 
14a8 : 85 1d __ STA ACCU + 2 
14aa : a5 46 __ LDA T0 + 3 
.l1295:
14ac : 85 1e __ STA ACCU + 3 
14ae : a9 00 __ LDA #$00
14b0 : 85 04 __ STA WORK + 1 
14b2 : 85 05 __ STA WORK + 2 
14b4 : 85 06 __ STA WORK + 3 
14b6 : 20 a2 1e JSR $1ea2 ; (divmod32@proxy + 0)
14b9 : 18 __ __ CLC
14ba : a5 07 __ LDA WORK + 4 
14bc : 69 30 __ ADC #$30
14be : c6 51 __ DEC T5 + 0 
14c0 : a6 51 __ LDX T5 + 0 
14c2 : 9d 76 9f STA $9f76,x ; (buffer + 0)
14c5 : a5 1e __ LDA ACCU + 3 
14c7 : d0 e3 __ BNE $14ac ; (printf.l1295 + 0)
.s1294:
14c9 : 85 46 __ STA T0 + 3 
14cb : a5 1d __ LDA ACCU + 2 
14cd : 85 45 __ STA T0 + 2 
14cf : a5 1c __ LDA ACCU + 1 
14d1 : 85 44 __ STA T0 + 1 
14d3 : a5 1b __ LDA ACCU + 0 
14d5 : 85 43 __ STA T0 + 0 
14d7 : 4c 08 14 JMP $1408 ; (printf.s1016 + 0)
.s136:
14da : 98 __ __ TYA
14db : 24 46 __ BIT T0 + 3 
14dd : 10 16 __ BPL $14f5 ; (printf.s389 + 0)
.s139:
14df : 38 __ __ SEC
14e0 : e5 43 __ SBC T0 + 0 
14e2 : 85 43 __ STA T0 + 0 
14e4 : 98 __ __ TYA
14e5 : e5 44 __ SBC T0 + 1 
14e7 : 85 44 __ STA T0 + 1 
14e9 : 98 __ __ TYA
14ea : e5 45 __ SBC T0 + 2 
14ec : 85 45 __ STA T0 + 2 
14ee : 98 __ __ TYA
14ef : e5 46 __ SBC T0 + 3 
14f1 : 85 46 __ STA T0 + 3 
14f3 : a9 01 __ LDA #$01
.s389:
14f5 : 85 51 __ STA T5 + 0 
14f7 : a9 10 __ LDA #$10
14f9 : 85 53 __ STA T6 + 0 
14fb : a5 46 __ LDA T0 + 3 
14fd : f0 03 __ BEQ $1502 ; (printf.s1006 + 0)
14ff : 4c a4 15 JMP $15a4 ; (printf.l143 + 0)
.s1006:
1502 : a5 45 __ LDA T0 + 2 
1504 : d0 f9 __ BNE $14ff ; (printf.s389 + 10)
.s1007:
1506 : a5 44 __ LDA T0 + 1 
1508 : d0 f5 __ BNE $14ff ; (printf.s389 + 10)
.s1008:
150a : c5 43 __ CMP T0 + 0 
150c : 90 f1 __ BCC $14ff ; (printf.s389 + 10)
.s144:
150e : ae c8 9f LDX $9fc8 ; (si + 2)
1511 : e8 __ __ INX
1512 : d0 04 __ BNE $1518 ; (printf.s1558 + 0)
.s1559:
1514 : a9 0f __ LDA #$0f
1516 : b0 05 __ BCS $151d ; (printf.s1103 + 0)
.s1558:
1518 : a9 10 __ LDA #$10
151a : ed c8 9f SBC $9fc8 ; (si + 2)
.s1103:
151d : a8 __ __ TAY
151e : c4 53 __ CPY T6 + 0 
1520 : b0 0d __ BCS $152f ; (printf.s147 + 0)
.s146:
1522 : a9 30 __ LDA #$30
.l1311:
1524 : c6 53 __ DEC T6 + 0 
1526 : a6 53 __ LDX T6 + 0 
1528 : 9d 86 9f STA $9f86,x ; (buffer + 0)
152b : c4 53 __ CPY T6 + 0 
152d : 90 f5 __ BCC $1524 ; (printf.l1311 + 0)
.s147:
152f : a9 00 __ LDA #$00
1531 : 85 4f __ STA T4 + 0 
1533 : a5 51 __ LDA T5 + 0 
1535 : f0 0b __ BEQ $1542 ; (printf.s152 + 0)
.s151:
1537 : c6 53 __ DEC T6 + 0 
1539 : a9 2d __ LDA #$2d
.s1096:
153b : a6 53 __ LDX T6 + 0 
153d : 9d 86 9f STA $9f86,x ; (buffer + 0)
1540 : b0 0b __ BCS $154d ; (printf.s2710 + 0)
.s152:
1542 : ad cb 9f LDA $9fcb ; (si + 5)
1545 : f0 06 __ BEQ $154d ; (printf.s2710 + 0)
.s154:
1547 : c6 53 __ DEC T6 + 0 
1549 : a9 2b __ LDA #$2b
154b : b0 ee __ BCS $153b ; (printf.s1096 + 0)
.s2710:
154d : ad cc 9f LDA $9fcc ; (si + 6)
1550 : f0 17 __ BEQ $1569 ; (printf.l160 + 0)
.l385:
1552 : a6 53 __ LDX T6 + 0 
1554 : e0 10 __ CPX #$10
1556 : 90 03 __ BCC $155b ; (printf.s157 + 0)
1558 : 4c bb 13 JMP $13bb ; (printf.s1170 + 0)
.s157:
155b : bd 86 9f LDA $9f86,x ; (buffer + 0)
155e : a6 4f __ LDX T4 + 0 
1560 : 9d ce 9f STA $9fce,x ; (buff + 0)
1563 : e6 4f __ INC T4 + 0 
1565 : e6 53 __ INC T6 + 0 
1567 : 90 e9 __ BCC $1552 ; (printf.l385 + 0)
.l160:
1569 : ad c7 9f LDA $9fc7 ; (si + 1)
156c : 18 __ __ CLC
156d : 65 53 __ ADC T6 + 0 
156f : 85 43 __ STA T0 + 0 
1571 : a5 53 __ LDA T6 + 0 
1573 : 2a __ __ ROL
1574 : 29 01 __ AND #$01
1576 : e9 00 __ SBC #$00
1578 : f0 06 __ BEQ $1580 ; (printf.s161 + 0)
.s1005:
157a : a9 10 __ LDA #$10
157c : c5 43 __ CMP T0 + 0 
157e : b0 0d __ BCS $158d ; (printf.l386 + 0)
.s161:
1580 : c6 53 __ DEC T6 + 0 
1582 : ad c6 9f LDA $9fc6 ; (si + 0)
1585 : a6 53 __ LDX T6 + 0 
1587 : 9d 86 9f STA $9f86,x ; (buffer + 0)
158a : 4c 69 15 JMP $1569 ; (printf.l160 + 0)
.l386:
158d : a6 53 __ LDX T6 + 0 
158f : e0 10 __ CPX #$10
1591 : 90 03 __ BCC $1596 ; (printf.s163 + 0)
1593 : 4c a2 13 JMP $13a2 ; (printf.s68 + 0)
.s163:
1596 : bd 86 9f LDA $9f86,x ; (buffer + 0)
1599 : a6 4f __ LDX T4 + 0 
159b : 9d ce 9f STA $9fce,x ; (buff + 0)
159e : e6 4f __ INC T4 + 0 
15a0 : e6 53 __ INC T6 + 0 
15a2 : 90 e9 __ BCC $158d ; (printf.l386 + 0)
.l143:
15a4 : a5 43 __ LDA T0 + 0 
15a6 : 85 1b __ STA ACCU + 0 
15a8 : a5 44 __ LDA T0 + 1 
15aa : 85 1c __ STA ACCU + 1 
15ac : a5 45 __ LDA T0 + 2 
15ae : 85 1d __ STA ACCU + 2 
15b0 : a5 46 __ LDA T0 + 3 
.l1287:
15b2 : 85 1e __ STA ACCU + 3 
15b4 : a9 00 __ LDA #$00
15b6 : 85 04 __ STA WORK + 1 
15b8 : 85 05 __ STA WORK + 2 
15ba : 85 06 __ STA WORK + 3 
15bc : 20 a2 1e JSR $1ea2 ; (divmod32@proxy + 0)
15bf : 18 __ __ CLC
15c0 : a5 07 __ LDA WORK + 4 
15c2 : 69 30 __ ADC #$30
15c4 : c6 53 __ DEC T6 + 0 
15c6 : a6 53 __ LDX T6 + 0 
15c8 : 9d 86 9f STA $9f86,x ; (buffer + 0)
15cb : a5 1e __ LDA ACCU + 3 
15cd : d0 e3 __ BNE $15b2 ; (printf.l1287 + 0)
.s1286:
15cf : 85 46 __ STA T0 + 3 
15d1 : a5 1d __ LDA ACCU + 2 
15d3 : 85 45 __ STA T0 + 2 
15d5 : a5 1c __ LDA ACCU + 1 
15d7 : 85 44 __ STA T0 + 1 
15d9 : a5 1b __ LDA ACCU + 0 
15db : 85 43 __ STA T0 + 0 
15dd : 4c 02 15 JMP $1502 ; (printf.s1006 + 0)
.s105:
15e0 : b1 4d __ LDA (T3 + 0),y 
15e2 : aa __ __ TAX
15e3 : a0 01 __ LDY #$01
15e5 : b1 4d __ LDA (T3 + 0),y 
15e7 : 85 44 __ STA T0 + 1 
15e9 : a5 4d __ LDA T3 + 0 
15eb : 69 01 __ ADC #$01
15ed : 85 4d __ STA T3 + 0 
15ef : 90 02 __ BCC $15f3 ; (printf.s1328 + 0)
.s1327:
15f1 : e6 4e __ INC T3 + 1 
.s1328:
15f3 : 8a __ __ TXA
15f4 : a8 __ __ TAY
15f5 : a2 10 __ LDX #$10
15f7 : 05 44 __ ORA T0 + 1 
15f9 : f0 26 __ BEQ $1621 ; (printf.s113 + 0)
.l112:
15fb : 98 __ __ TYA
15fc : 29 0f __ AND #$0f
15fe : 85 47 __ STA T1 + 0 
1600 : c9 0a __ CMP #$0a
1602 : a9 37 __ LDA #$37
1604 : b0 02 __ BCS $1608 ; (printf.s1551 + 0)
.s1550:
1606 : a9 30 __ LDA #$30
.s1551:
1608 : 18 __ __ CLC
1609 : 65 47 __ ADC T1 + 0 
160b : 9d 95 9f STA $9f95,x ; (buffer + 15)
160e : 98 __ __ TYA
160f : 46 44 __ LSR T0 + 1 
1611 : 6a __ __ ROR
1612 : 46 44 __ LSR T0 + 1 
1614 : 6a __ __ ROR
1615 : 46 44 __ LSR T0 + 1 
1617 : 6a __ __ ROR
1618 : 46 44 __ LSR T0 + 1 
161a : 6a __ __ ROR
161b : a8 __ __ TAY
161c : ca __ __ DEX
161d : 05 44 __ ORA T0 + 1 
161f : d0 da __ BNE $15fb ; (printf.l112 + 0)
.s113:
1621 : 86 51 __ STX T5 + 0 
1623 : ac c8 9f LDY $9fc8 ; (si + 2)
1626 : c8 __ __ INY
1627 : d0 04 __ BNE $162d ; (printf.s1552 + 0)
.s1553:
1629 : a9 0f __ LDA #$0f
162b : d0 06 __ BNE $1633 ; (printf.s1102 + 0)
.s1552:
162d : 38 __ __ SEC
162e : a9 10 __ LDA #$10
1630 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1102:
1633 : a8 __ __ TAY
1634 : c4 51 __ CPY T5 + 0 
1636 : b0 0d __ BCS $1645 ; (printf.s116 + 0)
.s115:
1638 : a9 30 __ LDA #$30
.l1309:
163a : c6 51 __ DEC T5 + 0 
163c : a6 51 __ LDX T5 + 0 
163e : 9d 96 9f STA $9f96,x ; (buffer + 0)
1641 : c4 51 __ CPY T5 + 0 
1643 : 90 f5 __ BCC $163a ; (printf.l1309 + 0)
.s116:
1645 : ad cd 9f LDA $9fcd ; (si + 7)
1648 : f0 10 __ BEQ $165a ; (printf.s121 + 0)
.s119:
164a : a9 58 __ LDA #$58
164c : 9d 95 9f STA $9f95,x ; (buffer + 15)
164f : 8a __ __ TXA
1650 : 69 fd __ ADC #$fd
1652 : 85 51 __ STA T5 + 0 
1654 : aa __ __ TAX
1655 : a9 30 __ LDA #$30
1657 : 9d 96 9f STA $9f96,x ; (buffer + 0)
.s121:
165a : a9 00 __ LDA #$00
165c : 85 4f __ STA T4 + 0 
165e : ad cb 9f LDA $9fcb ; (si + 5)
1661 : f0 09 __ BEQ $166c ; (printf.s2698 + 0)
.s123:
1663 : c6 51 __ DEC T5 + 0 
1665 : a9 2b __ LDA #$2b
1667 : a6 51 __ LDX T5 + 0 
1669 : 9d 96 9f STA $9f96,x ; (buffer + 0)
.s2698:
166c : ad cc 9f LDA $9fcc ; (si + 6)
166f : f0 17 __ BEQ $1688 ; (printf.l129 + 0)
.l379:
1671 : a6 51 __ LDX T5 + 0 
1673 : e0 10 __ CPX #$10
1675 : 90 03 __ BCC $167a ; (printf.s126 + 0)
1677 : 4c bb 13 JMP $13bb ; (printf.s1170 + 0)
.s126:
167a : bd 96 9f LDA $9f96,x ; (buffer + 0)
167d : a6 4f __ LDX T4 + 0 
167f : 9d ce 9f STA $9fce,x ; (buff + 0)
1682 : e6 4f __ INC T4 + 0 
1684 : e6 51 __ INC T5 + 0 
1686 : 90 e9 __ BCC $1671 ; (printf.l379 + 0)
.l129:
1688 : ad c7 9f LDA $9fc7 ; (si + 1)
168b : 18 __ __ CLC
168c : 65 51 __ ADC T5 + 0 
168e : 85 43 __ STA T0 + 0 
1690 : 8a __ __ TXA
1691 : 2a __ __ ROL
1692 : 29 01 __ AND #$01
1694 : e9 00 __ SBC #$00
1696 : f0 06 __ BEQ $169e ; (printf.s130 + 0)
.s1004:
1698 : a9 10 __ LDA #$10
169a : c5 43 __ CMP T0 + 0 
169c : b0 0d __ BCS $16ab ; (printf.l380 + 0)
.s130:
169e : c6 51 __ DEC T5 + 0 
16a0 : ad c6 9f LDA $9fc6 ; (si + 0)
16a3 : a6 51 __ LDX T5 + 0 
16a5 : 9d 96 9f STA $9f96,x ; (buffer + 0)
16a8 : 4c 88 16 JMP $1688 ; (printf.l129 + 0)
.l380:
16ab : a6 51 __ LDX T5 + 0 
16ad : e0 10 __ CPX #$10
16af : 90 03 __ BCC $16b4 ; (printf.s132 + 0)
16b1 : 4c a2 13 JMP $13a2 ; (printf.s68 + 0)
.s132:
16b4 : bd 96 9f LDA $9f96,x ; (buffer + 0)
16b7 : a6 4f __ LDX T4 + 0 
16b9 : 9d ce 9f STA $9fce,x ; (buff + 0)
16bc : e6 4f __ INC T4 + 0 
16be : e6 51 __ INC T5 + 0 
16c0 : 90 e9 __ BCC $16ab ; (printf.l380 + 0)
.s77:
16c2 : b1 4d __ LDA (T3 + 0),y 
16c4 : 85 43 __ STA T0 + 0 
16c6 : a0 01 __ LDY #$01
16c8 : b1 4d __ LDA (T3 + 0),y 
16ca : 85 44 __ STA T0 + 1 
16cc : a5 4d __ LDA T3 + 0 
16ce : 69 01 __ ADC #$01
16d0 : 85 4d __ STA T3 + 0 
16d2 : 90 02 __ BCC $16d6 ; (printf.s1326 + 0)
.s1325:
16d4 : e6 4e __ INC T3 + 1 
.s1326:
16d6 : a9 10 __ LDA #$10
16d8 : 85 51 __ STA T5 + 0 
16da : d0 17 __ BNE $16f3 ; (printf.l2680 + 0)
.s84:
16dc : 20 0a 1c JSR $1c0a ; (divmod@proxy + 0)
16df : a5 1b __ LDA ACCU + 0 
16e1 : 85 43 __ STA T0 + 0 
16e3 : a5 1c __ LDA ACCU + 1 
16e5 : 85 44 __ STA T0 + 1 
16e7 : 18 __ __ CLC
16e8 : a5 05 __ LDA WORK + 2 
16ea : 69 30 __ ADC #$30
16ec : c6 51 __ DEC T5 + 0 
16ee : a6 51 __ LDX T5 + 0 
16f0 : 9d a6 9f STA $9fa6,x ; (buffer + 0)
.l2680:
16f3 : a5 43 __ LDA T0 + 0 
16f5 : 05 44 __ ORA T0 + 1 
16f7 : d0 e3 __ BNE $16dc ; (printf.s84 + 0)
.s85:
16f9 : ae c8 9f LDX $9fc8 ; (si + 2)
16fc : e8 __ __ INX
16fd : d0 04 __ BNE $1703 ; (printf.s1546 + 0)
.s1547:
16ff : a9 0f __ LDA #$0f
1701 : d0 06 __ BNE $1709 ; (printf.s1101 + 0)
.s1546:
1703 : 38 __ __ SEC
1704 : a9 10 __ LDA #$10
1706 : ed c8 9f SBC $9fc8 ; (si + 2)
.s1101:
1709 : a8 __ __ TAY
170a : c4 51 __ CPY T5 + 0 
170c : b0 0d __ BCS $171b ; (printf.s88 + 0)
.s87:
170e : a9 30 __ LDA #$30
.l1307:
1710 : c6 51 __ DEC T5 + 0 
1712 : a6 51 __ LDX T5 + 0 
1714 : 9d a6 9f STA $9fa6,x ; (buffer + 0)
1717 : c4 51 __ CPY T5 + 0 
1719 : 90 f5 __ BCC $1710 ; (printf.l1307 + 0)
.s88:
171b : a9 00 __ LDA #$00
171d : 85 4f __ STA T4 + 0 
171f : ad cb 9f LDA $9fcb ; (si + 5)
1722 : f0 09 __ BEQ $172d ; (printf.s2685 + 0)
.s95:
1724 : c6 51 __ DEC T5 + 0 
1726 : a9 2b __ LDA #$2b
1728 : a6 51 __ LDX T5 + 0 
172a : 9d a6 9f STA $9fa6,x ; (buffer + 0)
.s2685:
172d : ad cc 9f LDA $9fcc ; (si + 6)
1730 : f0 17 __ BEQ $1749 ; (printf.l101 + 0)
.l373:
1732 : a6 51 __ LDX T5 + 0 
1734 : e0 10 __ CPX #$10
1736 : 90 03 __ BCC $173b ; (printf.s98 + 0)
1738 : 4c bb 13 JMP $13bb ; (printf.s1170 + 0)
.s98:
173b : bd a6 9f LDA $9fa6,x ; (buffer + 0)
173e : a6 4f __ LDX T4 + 0 
1740 : 9d ce 9f STA $9fce,x ; (buff + 0)
1743 : e6 4f __ INC T4 + 0 
1745 : e6 51 __ INC T5 + 0 
1747 : 90 e9 __ BCC $1732 ; (printf.l373 + 0)
.l101:
1749 : ad c7 9f LDA $9fc7 ; (si + 1)
174c : 18 __ __ CLC
174d : 65 51 __ ADC T5 + 0 
174f : 85 43 __ STA T0 + 0 
1751 : a5 51 __ LDA T5 + 0 
1753 : 2a __ __ ROL
1754 : 29 01 __ AND #$01
1756 : e9 00 __ SBC #$00
1758 : f0 06 __ BEQ $1760 ; (printf.s102 + 0)
.s1003:
175a : a9 10 __ LDA #$10
175c : c5 43 __ CMP T0 + 0 
175e : b0 0d __ BCS $176d ; (printf.l374 + 0)
.s102:
1760 : c6 51 __ DEC T5 + 0 
1762 : ad c6 9f LDA $9fc6 ; (si + 0)
1765 : a6 51 __ LDX T5 + 0 
1767 : 9d a6 9f STA $9fa6,x ; (buffer + 0)
176a : 4c 49 17 JMP $1749 ; (printf.l101 + 0)
.l374:
176d : a6 51 __ LDX T5 + 0 
176f : e0 10 __ CPX #$10
1771 : 90 03 __ BCC $1776 ; (printf.s104 + 0)
1773 : 4c a2 13 JMP $13a2 ; (printf.s68 + 0)
.s104:
1776 : bd a6 9f LDA $9fa6,x ; (buffer + 0)
1779 : a6 4f __ LDX T4 + 0 
177b : 9d ce 9f STA $9fce,x ; (buff + 0)
177e : e6 4f __ INC T4 + 0 
1780 : e6 51 __ INC T5 + 0 
1782 : 90 e9 __ BCC $176d ; (printf.l374 + 0)
.s47:
1784 : b1 4d __ LDA (T3 + 0),y 
1786 : 85 43 __ STA T0 + 0 
1788 : a0 01 __ LDY #$01
178a : b1 4d __ LDA (T3 + 0),y 
178c : 85 44 __ STA T0 + 1 
178e : 10 10 __ BPL $17a0 ; (printf.s53 + 0)
.s52:
1790 : a9 00 __ LDA #$00
1792 : e5 43 __ SBC T0 + 0 
1794 : 85 43 __ STA T0 + 0 
1796 : a9 00 __ LDA #$00
1798 : e5 44 __ SBC T0 + 1 
179a : 85 44 __ STA T0 + 1 
179c : a9 ff __ LDA #$ff
179e : d0 02 __ BNE $17a2 ; (printf.s371 + 0)
.s53:
17a0 : a9 00 __ LDA #$00
.s371:
17a2 : 85 51 __ STA T5 + 0 
17a4 : a9 10 __ LDA #$10
17a6 : 85 53 __ STA T6 + 0 
17a8 : 18 __ __ CLC
17a9 : a5 4d __ LDA T3 + 0 
17ab : 69 02 __ ADC #$02
17ad : 85 4d __ STA T3 + 0 
17af : 90 1b __ BCC $17cc ; (printf.l2662 + 0)
.s1321:
17b1 : e6 4e __ INC T3 + 1 
17b3 : b0 17 __ BCS $17cc ; (printf.l2662 + 0)
.s56:
17b5 : 20 0a 1c JSR $1c0a ; (divmod@proxy + 0)
17b8 : a5 1b __ LDA ACCU + 0 
17ba : 85 43 __ STA T0 + 0 
17bc : a5 1c __ LDA ACCU + 1 
17be : 85 44 __ STA T0 + 1 
17c0 : 18 __ __ CLC
17c1 : a5 05 __ LDA WORK + 2 
17c3 : 69 30 __ ADC #$30
17c5 : c6 53 __ DEC T6 + 0 
17c7 : a6 53 __ LDX T6 + 0 
17c9 : 9d b6 9f STA $9fb6,x ; (buffer + 0)
.l2662:
17cc : a5 43 __ LDA T0 + 0 
17ce : 05 44 __ ORA T0 + 1 
17d0 : d0 e3 __ BNE $17b5 ; (printf.s56 + 0)
.s57:
17d2 : ae c8 9f LDX $9fc8 ; (si + 2)
17d5 : e8 __ __ INX
17d6 : d0 04 __ BNE $17dc ; (printf.s1540 + 0)
.s1541:
17d8 : a9 0f __ LDA #$0f
17da : d0 06 __ BNE $17e2 ; (printf.s1100 + 0)
.s1540:
17dc : 38 __ __ SEC
17dd : a9 10 __ LDA #$10
17df : ed c8 9f SBC $9fc8 ; (si + 2)
.s1100:
17e2 : a8 __ __ TAY
17e3 : c4 53 __ CPY T6 + 0 
17e5 : b0 0d __ BCS $17f4 ; (printf.s60 + 0)
.s59:
17e7 : a9 30 __ LDA #$30
.l1305:
17e9 : c6 53 __ DEC T6 + 0 
17eb : a6 53 __ LDX T6 + 0 
17ed : 9d b6 9f STA $9fb6,x ; (buffer + 0)
17f0 : c4 53 __ CPY T6 + 0 
17f2 : 90 f5 __ BCC $17e9 ; (printf.l1305 + 0)
.s60:
17f4 : a9 00 __ LDA #$00
17f6 : 85 4f __ STA T4 + 0 
17f8 : 24 51 __ BIT T5 + 0 
17fa : 10 0b __ BPL $1807 ; (printf.s65 + 0)
.s64:
17fc : c6 53 __ DEC T6 + 0 
17fe : a9 2d __ LDA #$2d
.s1091:
1800 : a6 53 __ LDX T6 + 0 
1802 : 9d b6 9f STA $9fb6,x ; (buffer + 0)
1805 : b0 0b __ BCS $1812 ; (printf.s2667 + 0)
.s65:
1807 : ad cb 9f LDA $9fcb ; (si + 5)
180a : f0 06 __ BEQ $1812 ; (printf.s2667 + 0)
.s67:
180c : c6 53 __ DEC T6 + 0 
180e : a9 2b __ LDA #$2b
1810 : b0 ee __ BCS $1800 ; (printf.s1091 + 0)
.s2667:
1812 : ad cc 9f LDA $9fcc ; (si + 6)
1815 : f0 17 __ BEQ $182e ; (printf.l73 + 0)
.l367:
1817 : a6 53 __ LDX T6 + 0 
1819 : e0 10 __ CPX #$10
181b : 90 03 __ BCC $1820 ; (printf.s70 + 0)
181d : 4c bb 13 JMP $13bb ; (printf.s1170 + 0)
.s70:
1820 : bd b6 9f LDA $9fb6,x ; (buffer + 0)
1823 : a6 4f __ LDX T4 + 0 
1825 : 9d ce 9f STA $9fce,x ; (buff + 0)
1828 : e6 4f __ INC T4 + 0 
182a : e6 53 __ INC T6 + 0 
182c : 90 e9 __ BCC $1817 ; (printf.l367 + 0)
.l73:
182e : ad c7 9f LDA $9fc7 ; (si + 1)
1831 : 18 __ __ CLC
1832 : 65 53 __ ADC T6 + 0 
1834 : 85 43 __ STA T0 + 0 
1836 : a5 53 __ LDA T6 + 0 
1838 : 2a __ __ ROL
1839 : 29 01 __ AND #$01
183b : e9 00 __ SBC #$00
183d : f0 06 __ BEQ $1845 ; (printf.s74 + 0)
.s1002:
183f : a9 10 __ LDA #$10
1841 : c5 43 __ CMP T0 + 0 
1843 : b0 0d __ BCS $1852 ; (printf.l368 + 0)
.s74:
1845 : c6 53 __ DEC T6 + 0 
1847 : ad c6 9f LDA $9fc6 ; (si + 0)
184a : a6 53 __ LDX T6 + 0 
184c : 9d b6 9f STA $9fb6,x ; (buffer + 0)
184f : 4c 2e 18 JMP $182e ; (printf.l73 + 0)
.l368:
1852 : a6 53 __ LDX T6 + 0 
1854 : e0 10 __ CPX #$10
1856 : 90 03 __ BCC $185b ; (printf.s76 + 0)
1858 : 4c a2 13 JMP $13a2 ; (printf.s68 + 0)
.s76:
185b : bd b6 9f LDA $9fb6,x ; (buffer + 0)
185e : a6 4f __ LDX T4 + 0 
1860 : 9d ce 9f STA $9fce,x ; (buff + 0)
1863 : e6 4f __ INC T4 + 0 
1865 : e6 53 __ INC T6 + 0 
1867 : 90 e9 __ BCC $1852 ; (printf.l368 + 0)
.s4:
1869 : a6 47 __ LDX T1 + 0 
186b : 9d ce 9f STA $9fce,x ; (buff + 0)
186e : 8a __ __ TXA
186f : f0 38 __ BEQ $18a9 ; (printf.s1001 + 0)
.s349:
1871 : ae ce 9f LDX $9fce ; (buff + 0)
1874 : f0 33 __ BEQ $18a9 ; (printf.s1001 + 0)
.s1893:
1876 : a9 01 __ LDA #$01
1878 : 85 47 __ STA T1 + 0 
.l351:
187a : 8a __ __ TXA
187b : e0 0a __ CPX #$0a
187d : d0 08 __ BNE $1887 ; (printf.s355 + 0)
.s354:
187f : a9 0d __ LDA #$0d
.s1086:
1881 : 20 d2 ff JSR $ffd2 
1884 : 4c 9e 18 JMP $189e ; (printf.s350 + 0)
.s355:
1887 : c9 09 __ CMP #$09
1889 : d0 f6 __ BNE $1881 ; (printf.s1086 + 0)
.s356:
188b : a5 d3 __ LDA $d3 
188d : 29 03 __ AND #$03
188f : 85 43 __ STA T0 + 0 
.l358:
1891 : a9 20 __ LDA #$20
1893 : 20 d2 ff JSR $ffd2 
1896 : e6 43 __ INC T0 + 0 
1898 : a5 43 __ LDA T0 + 0 
189a : c9 04 __ CMP #$04
189c : 90 f3 __ BCC $1891 ; (printf.l358 + 0)
.s350:
189e : a6 47 __ LDX T1 + 0 
18a0 : bd ce 9f LDA $9fce,x ; (buff + 0)
18a3 : e6 47 __ INC T1 + 0 
18a5 : aa __ __ TAX
18a6 : a8 __ __ TAY
18a7 : d0 d1 __ BNE $187a ; (printf.l351 + 0)
.s1001:
18a9 : a2 05 __ LDX #$05
18ab : bd 5d 9f LDA $9f5d,x ; (printf@stack + 0)
18ae : 95 53 __ STA T6 + 0,x 
18b0 : ca __ __ DEX
18b1 : 10 f8 __ BPL $18ab ; (printf.s1001 + 2)
18b3 : 60 __ __ RTS
--------------------------------------------------------------------
18b4 : __ __ __ BYT 20 20 20 00                                     :    .
--------------------------------------------------------------------
18b8 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 00             :            .
--------------------------------------------------------------------
18c4 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 00                   :          .
--------------------------------------------------------------------
18ce : __ __ __ BYT 20 20 20 20 20 20 20 00                         :        .
--------------------------------------------------------------------
18d6 : __ __ __ BYT 20 20 20 20 20 00                               :      .
--------------------------------------------------------------------
18dc : __ __ __ BYT 3d 20 43 50 50 20 4e 4f 52 54 48 20 32 30 32 35 : = CPP NORTH 2025
18ec : __ __ __ BYT 20 3d 00                                        :  =.
--------------------------------------------------------------------
18ef : __ __ __ BYT 50 52 45 53 53 20 41 4e 59 20 4b 45 59 2e 2e 2e : PRESS ANY KEY...
18ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1900 : __ __ __ BYT 43 41 4e 41 44 49 41 4e 20 43 2b 2b 20 43 4f 4e : CANADIAN C++ CON
1910 : __ __ __ BYT 46 45 52 45 4e 43 45 00                         : FERENCE.
--------------------------------------------------------------------
1918 : __ __ __ BYT 2a 20 43 2b 2b 20 00                            : * C++ .
--------------------------------------------------------------------
191f : __ __ __ BYT 4e 20 4f 20 52 20 54 20 48 20 2a 00             : N O R T H *.
--------------------------------------------------------------------
freg: ; freg
192b : b1 19 __ LDA (IP + 0),y 
192d : c8 __ __ INY
192e : aa __ __ TAX
192f : b5 00 __ LDA $00,x 
1931 : 85 03 __ STA WORK + 0 
1933 : b5 01 __ LDA $01,x 
1935 : 85 04 __ STA WORK + 1 
1937 : b5 02 __ LDA $02,x 
1939 : 85 05 __ STA WORK + 2 
193b : b5 03 __ LDA WORK + 0,x 
193d : 85 06 __ STA WORK + 3 
193f : a5 05 __ LDA WORK + 2 
1941 : 0a __ __ ASL
1942 : a5 06 __ LDA WORK + 3 
1944 : 2a __ __ ROL
1945 : 85 08 __ STA WORK + 5 
1947 : f0 06 __ BEQ $194f ; (freg + 36)
1949 : a5 05 __ LDA WORK + 2 
194b : 09 80 __ ORA #$80
194d : 85 05 __ STA WORK + 2 
194f : a5 1d __ LDA ACCU + 2 
1951 : 0a __ __ ASL
1952 : a5 1e __ LDA ACCU + 3 
1954 : 2a __ __ ROL
1955 : 85 07 __ STA WORK + 4 
1957 : f0 06 __ BEQ $195f ; (freg + 52)
1959 : a5 1d __ LDA ACCU + 2 
195b : 09 80 __ ORA #$80
195d : 85 1d __ STA ACCU + 2 
195f : 60 __ __ RTS
1960 : 06 1e __ ASL ACCU + 3 
1962 : a5 07 __ LDA WORK + 4 
1964 : 6a __ __ ROR
1965 : 85 1e __ STA ACCU + 3 
1967 : b0 06 __ BCS $196f ; (freg + 68)
1969 : a5 1d __ LDA ACCU + 2 
196b : 29 7f __ AND #$7f
196d : 85 1d __ STA ACCU + 2 
196f : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1970 : a5 06 __ LDA WORK + 3 
1972 : 49 80 __ EOR #$80
1974 : 85 06 __ STA WORK + 3 
1976 : a9 ff __ LDA #$ff
1978 : c5 07 __ CMP WORK + 4 
197a : f0 04 __ BEQ $1980 ; (faddsub + 16)
197c : c5 08 __ CMP WORK + 5 
197e : d0 11 __ BNE $1991 ; (faddsub + 33)
1980 : a5 1e __ LDA ACCU + 3 
1982 : 09 7f __ ORA #$7f
1984 : 85 1e __ STA ACCU + 3 
1986 : a9 80 __ LDA #$80
1988 : 85 1d __ STA ACCU + 2 
198a : a9 00 __ LDA #$00
198c : 85 1b __ STA ACCU + 0 
198e : 85 1c __ STA ACCU + 1 
1990 : 60 __ __ RTS
1991 : 38 __ __ SEC
1992 : a5 07 __ LDA WORK + 4 
1994 : e5 08 __ SBC WORK + 5 
1996 : f0 38 __ BEQ $19d0 ; (faddsub + 96)
1998 : aa __ __ TAX
1999 : b0 25 __ BCS $19c0 ; (faddsub + 80)
199b : e0 e9 __ CPX #$e9
199d : b0 0e __ BCS $19ad ; (faddsub + 61)
199f : a5 08 __ LDA WORK + 5 
19a1 : 85 07 __ STA WORK + 4 
19a3 : a9 00 __ LDA #$00
19a5 : 85 1b __ STA ACCU + 0 
19a7 : 85 1c __ STA ACCU + 1 
19a9 : 85 1d __ STA ACCU + 2 
19ab : f0 23 __ BEQ $19d0 ; (faddsub + 96)
19ad : a5 1d __ LDA ACCU + 2 
19af : 4a __ __ LSR
19b0 : 66 1c __ ROR ACCU + 1 
19b2 : 66 1b __ ROR ACCU + 0 
19b4 : e8 __ __ INX
19b5 : d0 f8 __ BNE $19af ; (faddsub + 63)
19b7 : 85 1d __ STA ACCU + 2 
19b9 : a5 08 __ LDA WORK + 5 
19bb : 85 07 __ STA WORK + 4 
19bd : 4c d0 19 JMP $19d0 ; (faddsub + 96)
19c0 : e0 18 __ CPX #$18
19c2 : b0 33 __ BCS $19f7 ; (faddsub + 135)
19c4 : a5 05 __ LDA WORK + 2 
19c6 : 4a __ __ LSR
19c7 : 66 04 __ ROR WORK + 1 
19c9 : 66 03 __ ROR WORK + 0 
19cb : ca __ __ DEX
19cc : d0 f8 __ BNE $19c6 ; (faddsub + 86)
19ce : 85 05 __ STA WORK + 2 
19d0 : a5 1e __ LDA ACCU + 3 
19d2 : 29 80 __ AND #$80
19d4 : 85 1e __ STA ACCU + 3 
19d6 : 45 06 __ EOR WORK + 3 
19d8 : 30 31 __ BMI $1a0b ; (faddsub + 155)
19da : 18 __ __ CLC
19db : a5 1b __ LDA ACCU + 0 
19dd : 65 03 __ ADC WORK + 0 
19df : 85 1b __ STA ACCU + 0 
19e1 : a5 1c __ LDA ACCU + 1 
19e3 : 65 04 __ ADC WORK + 1 
19e5 : 85 1c __ STA ACCU + 1 
19e7 : a5 1d __ LDA ACCU + 2 
19e9 : 65 05 __ ADC WORK + 2 
19eb : 85 1d __ STA ACCU + 2 
19ed : 90 08 __ BCC $19f7 ; (faddsub + 135)
19ef : 66 1d __ ROR ACCU + 2 
19f1 : 66 1c __ ROR ACCU + 1 
19f3 : 66 1b __ ROR ACCU + 0 
19f5 : e6 07 __ INC WORK + 4 
19f7 : a5 07 __ LDA WORK + 4 
19f9 : c9 ff __ CMP #$ff
19fb : f0 83 __ BEQ $1980 ; (faddsub + 16)
19fd : 4a __ __ LSR
19fe : 05 1e __ ORA ACCU + 3 
1a00 : 85 1e __ STA ACCU + 3 
1a02 : b0 06 __ BCS $1a0a ; (faddsub + 154)
1a04 : a5 1d __ LDA ACCU + 2 
1a06 : 29 7f __ AND #$7f
1a08 : 85 1d __ STA ACCU + 2 
1a0a : 60 __ __ RTS
1a0b : 38 __ __ SEC
1a0c : a5 1b __ LDA ACCU + 0 
1a0e : e5 03 __ SBC WORK + 0 
1a10 : 85 1b __ STA ACCU + 0 
1a12 : a5 1c __ LDA ACCU + 1 
1a14 : e5 04 __ SBC WORK + 1 
1a16 : 85 1c __ STA ACCU + 1 
1a18 : a5 1d __ LDA ACCU + 2 
1a1a : e5 05 __ SBC WORK + 2 
1a1c : 85 1d __ STA ACCU + 2 
1a1e : b0 19 __ BCS $1a39 ; (faddsub + 201)
1a20 : 38 __ __ SEC
1a21 : a9 00 __ LDA #$00
1a23 : e5 1b __ SBC ACCU + 0 
1a25 : 85 1b __ STA ACCU + 0 
1a27 : a9 00 __ LDA #$00
1a29 : e5 1c __ SBC ACCU + 1 
1a2b : 85 1c __ STA ACCU + 1 
1a2d : a9 00 __ LDA #$00
1a2f : e5 1d __ SBC ACCU + 2 
1a31 : 85 1d __ STA ACCU + 2 
1a33 : a5 1e __ LDA ACCU + 3 
1a35 : 49 80 __ EOR #$80
1a37 : 85 1e __ STA ACCU + 3 
1a39 : a5 1d __ LDA ACCU + 2 
1a3b : 30 ba __ BMI $19f7 ; (faddsub + 135)
1a3d : 05 1c __ ORA ACCU + 1 
1a3f : 05 1b __ ORA ACCU + 0 
1a41 : f0 0f __ BEQ $1a52 ; (faddsub + 226)
1a43 : c6 07 __ DEC WORK + 4 
1a45 : f0 0b __ BEQ $1a52 ; (faddsub + 226)
1a47 : 06 1b __ ASL ACCU + 0 
1a49 : 26 1c __ ROL ACCU + 1 
1a4b : 26 1d __ ROL ACCU + 2 
1a4d : 10 f4 __ BPL $1a43 ; (faddsub + 211)
1a4f : 4c f7 19 JMP $19f7 ; (faddsub + 135)
1a52 : a9 00 __ LDA #$00
1a54 : 85 1b __ STA ACCU + 0 
1a56 : 85 1c __ STA ACCU + 1 
1a58 : 85 1d __ STA ACCU + 2 
1a5a : 85 1e __ STA ACCU + 3 
1a5c : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1a5d : a5 1b __ LDA ACCU + 0 
1a5f : 05 1c __ ORA ACCU + 1 
1a61 : 05 1d __ ORA ACCU + 2 
1a63 : f0 0e __ BEQ $1a73 ; (crt_fmul + 22)
1a65 : a5 03 __ LDA WORK + 0 
1a67 : 05 04 __ ORA WORK + 1 
1a69 : 05 05 __ ORA WORK + 2 
1a6b : d0 09 __ BNE $1a76 ; (crt_fmul + 25)
1a6d : 85 1b __ STA ACCU + 0 
1a6f : 85 1c __ STA ACCU + 1 
1a71 : 85 1d __ STA ACCU + 2 
1a73 : 85 1e __ STA ACCU + 3 
1a75 : 60 __ __ RTS
1a76 : a5 1e __ LDA ACCU + 3 
1a78 : 45 06 __ EOR WORK + 3 
1a7a : 29 80 __ AND #$80
1a7c : 85 1e __ STA ACCU + 3 
1a7e : a9 ff __ LDA #$ff
1a80 : c5 07 __ CMP WORK + 4 
1a82 : f0 42 __ BEQ $1ac6 ; (crt_fmul + 105)
1a84 : c5 08 __ CMP WORK + 5 
1a86 : f0 3e __ BEQ $1ac6 ; (crt_fmul + 105)
1a88 : a9 00 __ LDA #$00
1a8a : 85 09 __ STA WORK + 6 
1a8c : 85 0a __ STA WORK + 7 
1a8e : 85 0b __ STA WORK + 8 
1a90 : a4 1b __ LDY ACCU + 0 
1a92 : a5 03 __ LDA WORK + 0 
1a94 : d0 06 __ BNE $1a9c ; (crt_fmul + 63)
1a96 : a5 04 __ LDA WORK + 1 
1a98 : f0 0a __ BEQ $1aa4 ; (crt_fmul + 71)
1a9a : d0 05 __ BNE $1aa1 ; (crt_fmul + 68)
1a9c : 20 f7 1a JSR $1af7 ; (crt_fmul8 + 0)
1a9f : a5 04 __ LDA WORK + 1 
1aa1 : 20 f7 1a JSR $1af7 ; (crt_fmul8 + 0)
1aa4 : a5 05 __ LDA WORK + 2 
1aa6 : 20 f7 1a JSR $1af7 ; (crt_fmul8 + 0)
1aa9 : 38 __ __ SEC
1aaa : a5 0b __ LDA WORK + 8 
1aac : 30 06 __ BMI $1ab4 ; (crt_fmul + 87)
1aae : 06 09 __ ASL WORK + 6 
1ab0 : 26 0a __ ROL WORK + 7 
1ab2 : 2a __ __ ROL
1ab3 : 18 __ __ CLC
1ab4 : 29 7f __ AND #$7f
1ab6 : 85 0b __ STA WORK + 8 
1ab8 : a5 07 __ LDA WORK + 4 
1aba : 65 08 __ ADC WORK + 5 
1abc : 90 19 __ BCC $1ad7 ; (crt_fmul + 122)
1abe : e9 7f __ SBC #$7f
1ac0 : b0 04 __ BCS $1ac6 ; (crt_fmul + 105)
1ac2 : c9 ff __ CMP #$ff
1ac4 : d0 15 __ BNE $1adb ; (crt_fmul + 126)
1ac6 : a5 1e __ LDA ACCU + 3 
1ac8 : 09 7f __ ORA #$7f
1aca : 85 1e __ STA ACCU + 3 
1acc : a9 80 __ LDA #$80
1ace : 85 1d __ STA ACCU + 2 
1ad0 : a9 00 __ LDA #$00
1ad2 : 85 1b __ STA ACCU + 0 
1ad4 : 85 1c __ STA ACCU + 1 
1ad6 : 60 __ __ RTS
1ad7 : e9 7e __ SBC #$7e
1ad9 : 90 15 __ BCC $1af0 ; (crt_fmul + 147)
1adb : 4a __ __ LSR
1adc : 05 1e __ ORA ACCU + 3 
1ade : 85 1e __ STA ACCU + 3 
1ae0 : a9 00 __ LDA #$00
1ae2 : 6a __ __ ROR
1ae3 : 05 0b __ ORA WORK + 8 
1ae5 : 85 1d __ STA ACCU + 2 
1ae7 : a5 0a __ LDA WORK + 7 
1ae9 : 85 1c __ STA ACCU + 1 
1aeb : a5 09 __ LDA WORK + 6 
1aed : 85 1b __ STA ACCU + 0 
1aef : 60 __ __ RTS
1af0 : a9 00 __ LDA #$00
1af2 : 85 1e __ STA ACCU + 3 
1af4 : f0 d8 __ BEQ $1ace ; (crt_fmul + 113)
1af6 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1af7 : 38 __ __ SEC
1af8 : 6a __ __ ROR
1af9 : 90 1e __ BCC $1b19 ; (crt_fmul8 + 34)
1afb : aa __ __ TAX
1afc : 18 __ __ CLC
1afd : 98 __ __ TYA
1afe : 65 09 __ ADC WORK + 6 
1b00 : 85 09 __ STA WORK + 6 
1b02 : a5 0a __ LDA WORK + 7 
1b04 : 65 1c __ ADC ACCU + 1 
1b06 : 85 0a __ STA WORK + 7 
1b08 : a5 0b __ LDA WORK + 8 
1b0a : 65 1d __ ADC ACCU + 2 
1b0c : 6a __ __ ROR
1b0d : 85 0b __ STA WORK + 8 
1b0f : 8a __ __ TXA
1b10 : 66 0a __ ROR WORK + 7 
1b12 : 66 09 __ ROR WORK + 6 
1b14 : 4a __ __ LSR
1b15 : f0 0d __ BEQ $1b24 ; (crt_fmul8 + 45)
1b17 : b0 e2 __ BCS $1afb ; (crt_fmul8 + 4)
1b19 : 66 0b __ ROR WORK + 8 
1b1b : 66 0a __ ROR WORK + 7 
1b1d : 66 09 __ ROR WORK + 6 
1b1f : 4a __ __ LSR
1b20 : 90 f7 __ BCC $1b19 ; (crt_fmul8 + 34)
1b22 : d0 d7 __ BNE $1afb ; (crt_fmul8 + 4)
1b24 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1b25 : a5 1b __ LDA ACCU + 0 
1b27 : 05 1c __ ORA ACCU + 1 
1b29 : 05 1d __ ORA ACCU + 2 
1b2b : d0 03 __ BNE $1b30 ; (crt_fdiv + 11)
1b2d : 85 1e __ STA ACCU + 3 
1b2f : 60 __ __ RTS
1b30 : a5 1e __ LDA ACCU + 3 
1b32 : 45 06 __ EOR WORK + 3 
1b34 : 29 80 __ AND #$80
1b36 : 85 1e __ STA ACCU + 3 
1b38 : a5 08 __ LDA WORK + 5 
1b3a : f0 62 __ BEQ $1b9e ; (crt_fdiv + 121)
1b3c : a5 07 __ LDA WORK + 4 
1b3e : c9 ff __ CMP #$ff
1b40 : f0 5c __ BEQ $1b9e ; (crt_fdiv + 121)
1b42 : a9 00 __ LDA #$00
1b44 : 85 09 __ STA WORK + 6 
1b46 : 85 0a __ STA WORK + 7 
1b48 : 85 0b __ STA WORK + 8 
1b4a : a2 18 __ LDX #$18
1b4c : a5 1b __ LDA ACCU + 0 
1b4e : c5 03 __ CMP WORK + 0 
1b50 : a5 1c __ LDA ACCU + 1 
1b52 : e5 04 __ SBC WORK + 1 
1b54 : a5 1d __ LDA ACCU + 2 
1b56 : e5 05 __ SBC WORK + 2 
1b58 : 90 13 __ BCC $1b6d ; (crt_fdiv + 72)
1b5a : a5 1b __ LDA ACCU + 0 
1b5c : e5 03 __ SBC WORK + 0 
1b5e : 85 1b __ STA ACCU + 0 
1b60 : a5 1c __ LDA ACCU + 1 
1b62 : e5 04 __ SBC WORK + 1 
1b64 : 85 1c __ STA ACCU + 1 
1b66 : a5 1d __ LDA ACCU + 2 
1b68 : e5 05 __ SBC WORK + 2 
1b6a : 85 1d __ STA ACCU + 2 
1b6c : 38 __ __ SEC
1b6d : 26 09 __ ROL WORK + 6 
1b6f : 26 0a __ ROL WORK + 7 
1b71 : 26 0b __ ROL WORK + 8 
1b73 : ca __ __ DEX
1b74 : f0 0a __ BEQ $1b80 ; (crt_fdiv + 91)
1b76 : 06 1b __ ASL ACCU + 0 
1b78 : 26 1c __ ROL ACCU + 1 
1b7a : 26 1d __ ROL ACCU + 2 
1b7c : b0 dc __ BCS $1b5a ; (crt_fdiv + 53)
1b7e : 90 cc __ BCC $1b4c ; (crt_fdiv + 39)
1b80 : 38 __ __ SEC
1b81 : a5 0b __ LDA WORK + 8 
1b83 : 30 06 __ BMI $1b8b ; (crt_fdiv + 102)
1b85 : 06 09 __ ASL WORK + 6 
1b87 : 26 0a __ ROL WORK + 7 
1b89 : 2a __ __ ROL
1b8a : 18 __ __ CLC
1b8b : 29 7f __ AND #$7f
1b8d : 85 0b __ STA WORK + 8 
1b8f : a5 07 __ LDA WORK + 4 
1b91 : e5 08 __ SBC WORK + 5 
1b93 : 90 1a __ BCC $1baf ; (crt_fdiv + 138)
1b95 : 18 __ __ CLC
1b96 : 69 7f __ ADC #$7f
1b98 : b0 04 __ BCS $1b9e ; (crt_fdiv + 121)
1b9a : c9 ff __ CMP #$ff
1b9c : d0 15 __ BNE $1bb3 ; (crt_fdiv + 142)
1b9e : a5 1e __ LDA ACCU + 3 
1ba0 : 09 7f __ ORA #$7f
1ba2 : 85 1e __ STA ACCU + 3 
1ba4 : a9 80 __ LDA #$80
1ba6 : 85 1d __ STA ACCU + 2 
1ba8 : a9 00 __ LDA #$00
1baa : 85 1c __ STA ACCU + 1 
1bac : 85 1b __ STA ACCU + 0 
1bae : 60 __ __ RTS
1baf : 69 7f __ ADC #$7f
1bb1 : 90 15 __ BCC $1bc8 ; (crt_fdiv + 163)
1bb3 : 4a __ __ LSR
1bb4 : 05 1e __ ORA ACCU + 3 
1bb6 : 85 1e __ STA ACCU + 3 
1bb8 : a9 00 __ LDA #$00
1bba : 6a __ __ ROR
1bbb : 05 0b __ ORA WORK + 8 
1bbd : 85 1d __ STA ACCU + 2 
1bbf : a5 0a __ LDA WORK + 7 
1bc1 : 85 1c __ STA ACCU + 1 
1bc3 : a5 09 __ LDA WORK + 6 
1bc5 : 85 1b __ STA ACCU + 0 
1bc7 : 60 __ __ RTS
1bc8 : a9 00 __ LDA #$00
1bca : 85 1e __ STA ACCU + 3 
1bcc : 85 1d __ STA ACCU + 2 
1bce : 85 1c __ STA ACCU + 1 
1bd0 : 85 1b __ STA ACCU + 0 
1bd2 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1bd3 : 24 1c __ BIT ACCU + 1 
1bd5 : 10 0d __ BPL $1be4 ; (divs16 + 17)
1bd7 : 20 ee 1b JSR $1bee ; (negaccu + 0)
1bda : 24 04 __ BIT WORK + 1 
1bdc : 10 0d __ BPL $1beb ; (divs16 + 24)
1bde : 20 fc 1b JSR $1bfc ; (negtmp + 0)
1be1 : 4c 1a 1c JMP $1c1a ; (divmod + 0)
1be4 : 24 04 __ BIT WORK + 1 
1be6 : 10 f9 __ BPL $1be1 ; (divs16 + 14)
1be8 : 20 fc 1b JSR $1bfc ; (negtmp + 0)
1beb : 20 1a 1c JSR $1c1a ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1bee : 38 __ __ SEC
1bef : a9 00 __ LDA #$00
1bf1 : e5 1b __ SBC ACCU + 0 
1bf3 : 85 1b __ STA ACCU + 0 
1bf5 : a9 00 __ LDA #$00
1bf7 : e5 1c __ SBC ACCU + 1 
1bf9 : 85 1c __ STA ACCU + 1 
1bfb : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1bfc : 38 __ __ SEC
1bfd : a9 00 __ LDA #$00
1bff : e5 03 __ SBC WORK + 0 
1c01 : 85 03 __ STA WORK + 0 
1c03 : a9 00 __ LDA #$00
1c05 : e5 04 __ SBC WORK + 1 
1c07 : 85 04 __ STA WORK + 1 
1c09 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
1c0a : a9 0a __ LDA #$0a
1c0c : 85 03 __ STA WORK + 0 
1c0e : a9 00 __ LDA #$00
1c10 : 85 04 __ STA WORK + 1 
1c12 : a5 43 __ LDA $43 
1c14 : 85 1b __ STA ACCU + 0 
1c16 : a5 44 __ LDA $44 
1c18 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
divmod: ; divmod
1c1a : a5 1c __ LDA ACCU + 1 
1c1c : d0 31 __ BNE $1c4f ; (divmod + 53)
1c1e : a5 04 __ LDA WORK + 1 
1c20 : d0 1e __ BNE $1c40 ; (divmod + 38)
1c22 : 85 06 __ STA WORK + 3 
1c24 : a2 04 __ LDX #$04
1c26 : 06 1b __ ASL ACCU + 0 
1c28 : 2a __ __ ROL
1c29 : c5 03 __ CMP WORK + 0 
1c2b : 90 02 __ BCC $1c2f ; (divmod + 21)
1c2d : e5 03 __ SBC WORK + 0 
1c2f : 26 1b __ ROL ACCU + 0 
1c31 : 2a __ __ ROL
1c32 : c5 03 __ CMP WORK + 0 
1c34 : 90 02 __ BCC $1c38 ; (divmod + 30)
1c36 : e5 03 __ SBC WORK + 0 
1c38 : 26 1b __ ROL ACCU + 0 
1c3a : ca __ __ DEX
1c3b : d0 eb __ BNE $1c28 ; (divmod + 14)
1c3d : 85 05 __ STA WORK + 2 
1c3f : 60 __ __ RTS
1c40 : a5 1b __ LDA ACCU + 0 
1c42 : 85 05 __ STA WORK + 2 
1c44 : a5 1c __ LDA ACCU + 1 
1c46 : 85 06 __ STA WORK + 3 
1c48 : a9 00 __ LDA #$00
1c4a : 85 1b __ STA ACCU + 0 
1c4c : 85 1c __ STA ACCU + 1 
1c4e : 60 __ __ RTS
1c4f : a5 04 __ LDA WORK + 1 
1c51 : d0 1f __ BNE $1c72 ; (divmod + 88)
1c53 : a5 03 __ LDA WORK + 0 
1c55 : 30 1b __ BMI $1c72 ; (divmod + 88)
1c57 : a9 00 __ LDA #$00
1c59 : 85 06 __ STA WORK + 3 
1c5b : a2 10 __ LDX #$10
1c5d : 06 1b __ ASL ACCU + 0 
1c5f : 26 1c __ ROL ACCU + 1 
1c61 : 2a __ __ ROL
1c62 : c5 03 __ CMP WORK + 0 
1c64 : 90 02 __ BCC $1c68 ; (divmod + 78)
1c66 : e5 03 __ SBC WORK + 0 
1c68 : 26 1b __ ROL ACCU + 0 
1c6a : 26 1c __ ROL ACCU + 1 
1c6c : ca __ __ DEX
1c6d : d0 f2 __ BNE $1c61 ; (divmod + 71)
1c6f : 85 05 __ STA WORK + 2 
1c71 : 60 __ __ RTS
1c72 : a9 00 __ LDA #$00
1c74 : 85 05 __ STA WORK + 2 
1c76 : 85 06 __ STA WORK + 3 
1c78 : 84 02 __ STY $02 
1c7a : a0 10 __ LDY #$10
1c7c : 18 __ __ CLC
1c7d : 26 1b __ ROL ACCU + 0 
1c7f : 26 1c __ ROL ACCU + 1 
1c81 : 26 05 __ ROL WORK + 2 
1c83 : 26 06 __ ROL WORK + 3 
1c85 : 38 __ __ SEC
1c86 : a5 05 __ LDA WORK + 2 
1c88 : e5 03 __ SBC WORK + 0 
1c8a : aa __ __ TAX
1c8b : a5 06 __ LDA WORK + 3 
1c8d : e5 04 __ SBC WORK + 1 
1c8f : 90 04 __ BCC $1c95 ; (divmod + 123)
1c91 : 86 05 __ STX WORK + 2 
1c93 : 85 06 __ STA WORK + 3 
1c95 : 88 __ __ DEY
1c96 : d0 e5 __ BNE $1c7d ; (divmod + 99)
1c98 : 26 1b __ ROL ACCU + 0 
1c9a : 26 1c __ ROL ACCU + 1 
1c9c : a4 02 __ LDY $02 
1c9e : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
1c9f : 24 1c __ BIT ACCU + 1 
1ca1 : 10 10 __ BPL $1cb3 ; (mods16 + 20)
1ca3 : 20 ee 1b JSR $1bee ; (negaccu + 0)
1ca6 : 24 04 __ BIT WORK + 1 
1ca8 : 10 03 __ BPL $1cad ; (mods16 + 14)
1caa : 20 fc 1b JSR $1bfc ; (negtmp + 0)
1cad : 20 1a 1c JSR $1c1a ; (divmod + 0)
1cb0 : 4c e8 1c JMP $1ce8 ; (negtmpb + 0)
1cb3 : 24 04 __ BIT WORK + 1 
1cb5 : 10 03 __ BPL $1cba ; (mods16 + 27)
1cb7 : 20 fc 1b JSR $1bfc ; (negtmp + 0)
1cba : 4c 1a 1c JMP $1c1a ; (divmod + 0)
1cbd : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1ce8 : 38 __ __ SEC
1ce9 : a9 00 __ LDA #$00
1ceb : e5 05 __ SBC WORK + 2 
1ced : 85 05 __ STA WORK + 2 
1cef : a9 00 __ LDA #$00
1cf1 : e5 06 __ SBC WORK + 3 
1cf3 : 85 06 __ STA WORK + 3 
1cf5 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1cf6 : 20 4f 19 JSR $194f ; (freg + 36)
1cf9 : a5 07 __ LDA WORK + 4 
1cfb : c9 7f __ CMP #$7f
1cfd : b0 07 __ BCS $1d06 ; (f32_to_i16 + 16)
1cff : a9 00 __ LDA #$00
1d01 : 85 1b __ STA ACCU + 0 
1d03 : 85 1c __ STA ACCU + 1 
1d05 : 60 __ __ RTS
1d06 : 38 __ __ SEC
1d07 : e9 8e __ SBC #$8e
1d09 : 90 16 __ BCC $1d21 ; (f32_to_i16 + 43)
1d0b : 24 1e __ BIT ACCU + 3 
1d0d : 30 09 __ BMI $1d18 ; (f32_to_i16 + 34)
1d0f : a9 ff __ LDA #$ff
1d11 : 85 1b __ STA ACCU + 0 
1d13 : a9 7f __ LDA #$7f
1d15 : 85 1c __ STA ACCU + 1 
1d17 : 60 __ __ RTS
1d18 : a9 00 __ LDA #$00
1d1a : 85 1b __ STA ACCU + 0 
1d1c : a9 80 __ LDA #$80
1d1e : 85 1c __ STA ACCU + 1 
1d20 : 60 __ __ RTS
1d21 : aa __ __ TAX
1d22 : 46 1d __ LSR ACCU + 2 
1d24 : 66 1c __ ROR ACCU + 1 
1d26 : e8 __ __ INX
1d27 : d0 f9 __ BNE $1d22 ; (f32_to_i16 + 44)
1d29 : 24 1e __ BIT ACCU + 3 
1d2b : 10 0e __ BPL $1d3b ; (f32_to_i16 + 69)
1d2d : 38 __ __ SEC
1d2e : a9 00 __ LDA #$00
1d30 : e5 1c __ SBC ACCU + 1 
1d32 : 85 1b __ STA ACCU + 0 
1d34 : a9 00 __ LDA #$00
1d36 : e5 1d __ SBC ACCU + 2 
1d38 : 85 1c __ STA ACCU + 1 
1d3a : 60 __ __ RTS
1d3b : a5 1c __ LDA ACCU + 1 
1d3d : 85 1b __ STA ACCU + 0 
1d3f : a5 1d __ LDA ACCU + 2 
1d41 : 85 1c __ STA ACCU + 1 
1d43 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1d44 : 24 1c __ BIT ACCU + 1 
1d46 : 30 03 __ BMI $1d4b ; (sint16_to_float + 7)
1d48 : 4c 62 1d JMP $1d62 ; (uint16_to_float + 0)
1d4b : 38 __ __ SEC
1d4c : a9 00 __ LDA #$00
1d4e : e5 1b __ SBC ACCU + 0 
1d50 : 85 1b __ STA ACCU + 0 
1d52 : a9 00 __ LDA #$00
1d54 : e5 1c __ SBC ACCU + 1 
1d56 : 85 1c __ STA ACCU + 1 
1d58 : 20 62 1d JSR $1d62 ; (uint16_to_float + 0)
1d5b : a5 1e __ LDA ACCU + 3 
1d5d : 09 80 __ ORA #$80
1d5f : 85 1e __ STA ACCU + 3 
1d61 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1d62 : a5 1b __ LDA ACCU + 0 
1d64 : 05 1c __ ORA ACCU + 1 
1d66 : d0 05 __ BNE $1d6d ; (uint16_to_float + 11)
1d68 : 85 1d __ STA ACCU + 2 
1d6a : 85 1e __ STA ACCU + 3 
1d6c : 60 __ __ RTS
1d6d : a2 8e __ LDX #$8e
1d6f : a5 1c __ LDA ACCU + 1 
1d71 : 30 06 __ BMI $1d79 ; (uint16_to_float + 23)
1d73 : ca __ __ DEX
1d74 : 06 1b __ ASL ACCU + 0 
1d76 : 2a __ __ ROL
1d77 : 10 fa __ BPL $1d73 ; (uint16_to_float + 17)
1d79 : 29 7f __ AND #$7f
1d7b : 85 1d __ STA ACCU + 2 
1d7d : a5 1b __ LDA ACCU + 0 
1d7f : 85 1c __ STA ACCU + 1 
1d81 : 8a __ __ TXA
1d82 : 4a __ __ LSR
1d83 : 85 1e __ STA ACCU + 3 
1d85 : a9 00 __ LDA #$00
1d87 : 85 1b __ STA ACCU + 0 
1d89 : 6a __ __ ROR
1d8a : 05 1d __ ORA ACCU + 2 
1d8c : 85 1d __ STA ACCU + 2 
1d8e : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1dad : 84 02 __ STY $02 
1daf : a0 20 __ LDY #$20
1db1 : a9 00 __ LDA #$00
1db3 : 85 07 __ STA WORK + 4 
1db5 : 85 08 __ STA WORK + 5 
1db7 : 85 09 __ STA WORK + 6 
1db9 : 85 0a __ STA WORK + 7 
1dbb : a5 05 __ LDA WORK + 2 
1dbd : 05 06 __ ORA WORK + 3 
1dbf : d0 78 __ BNE $1e39 ; (divmod32 + 140)
1dc1 : a5 04 __ LDA WORK + 1 
1dc3 : d0 27 __ BNE $1dec ; (divmod32 + 63)
1dc5 : 18 __ __ CLC
1dc6 : 26 1b __ ROL ACCU + 0 
1dc8 : 26 1c __ ROL ACCU + 1 
1dca : 26 1d __ ROL ACCU + 2 
1dcc : 26 1e __ ROL ACCU + 3 
1dce : 2a __ __ ROL
1dcf : 90 05 __ BCC $1dd6 ; (divmod32 + 41)
1dd1 : e5 03 __ SBC WORK + 0 
1dd3 : 38 __ __ SEC
1dd4 : b0 06 __ BCS $1ddc ; (divmod32 + 47)
1dd6 : c5 03 __ CMP WORK + 0 
1dd8 : 90 02 __ BCC $1ddc ; (divmod32 + 47)
1dda : e5 03 __ SBC WORK + 0 
1ddc : 88 __ __ DEY
1ddd : d0 e7 __ BNE $1dc6 ; (divmod32 + 25)
1ddf : 85 07 __ STA WORK + 4 
1de1 : 26 1b __ ROL ACCU + 0 
1de3 : 26 1c __ ROL ACCU + 1 
1de5 : 26 1d __ ROL ACCU + 2 
1de7 : 26 1e __ ROL ACCU + 3 
1de9 : a4 02 __ LDY $02 
1deb : 60 __ __ RTS
1dec : a5 1e __ LDA ACCU + 3 
1dee : d0 10 __ BNE $1e00 ; (divmod32 + 83)
1df0 : a6 1d __ LDX ACCU + 2 
1df2 : 86 1e __ STX ACCU + 3 
1df4 : a6 1c __ LDX ACCU + 1 
1df6 : 86 1d __ STX ACCU + 2 
1df8 : a6 1b __ LDX ACCU + 0 
1dfa : 86 1c __ STX ACCU + 1 
1dfc : 85 1b __ STA ACCU + 0 
1dfe : a0 18 __ LDY #$18
1e00 : 18 __ __ CLC
1e01 : 26 1b __ ROL ACCU + 0 
1e03 : 26 1c __ ROL ACCU + 1 
1e05 : 26 1d __ ROL ACCU + 2 
1e07 : 26 1e __ ROL ACCU + 3 
1e09 : 26 07 __ ROL WORK + 4 
1e0b : 26 08 __ ROL WORK + 5 
1e0d : 90 0c __ BCC $1e1b ; (divmod32 + 110)
1e0f : a5 07 __ LDA WORK + 4 
1e11 : e5 03 __ SBC WORK + 0 
1e13 : aa __ __ TAX
1e14 : a5 08 __ LDA WORK + 5 
1e16 : e5 04 __ SBC WORK + 1 
1e18 : 38 __ __ SEC
1e19 : b0 0c __ BCS $1e27 ; (divmod32 + 122)
1e1b : 38 __ __ SEC
1e1c : a5 07 __ LDA WORK + 4 
1e1e : e5 03 __ SBC WORK + 0 
1e20 : aa __ __ TAX
1e21 : a5 08 __ LDA WORK + 5 
1e23 : e5 04 __ SBC WORK + 1 
1e25 : 90 04 __ BCC $1e2b ; (divmod32 + 126)
1e27 : 86 07 __ STX WORK + 4 
1e29 : 85 08 __ STA WORK + 5 
1e2b : 88 __ __ DEY
1e2c : d0 d3 __ BNE $1e01 ; (divmod32 + 84)
1e2e : 26 1b __ ROL ACCU + 0 
1e30 : 26 1c __ ROL ACCU + 1 
1e32 : 26 1d __ ROL ACCU + 2 
1e34 : 26 1e __ ROL ACCU + 3 
1e36 : a4 02 __ LDY $02 
1e38 : 60 __ __ RTS
1e39 : a0 10 __ LDY #$10
1e3b : a5 1e __ LDA ACCU + 3 
1e3d : 85 08 __ STA WORK + 5 
1e3f : a5 1d __ LDA ACCU + 2 
1e41 : 85 07 __ STA WORK + 4 
1e43 : a9 00 __ LDA #$00
1e45 : 85 1d __ STA ACCU + 2 
1e47 : 85 1e __ STA ACCU + 3 
1e49 : 18 __ __ CLC
1e4a : 26 1b __ ROL ACCU + 0 
1e4c : 26 1c __ ROL ACCU + 1 
1e4e : 26 07 __ ROL WORK + 4 
1e50 : 26 08 __ ROL WORK + 5 
1e52 : 26 09 __ ROL WORK + 6 
1e54 : 26 0a __ ROL WORK + 7 
1e56 : a5 07 __ LDA WORK + 4 
1e58 : c5 03 __ CMP WORK + 0 
1e5a : a5 08 __ LDA WORK + 5 
1e5c : e5 04 __ SBC WORK + 1 
1e5e : a5 09 __ LDA WORK + 6 
1e60 : e5 05 __ SBC WORK + 2 
1e62 : aa __ __ TAX
1e63 : a5 0a __ LDA WORK + 7 
1e65 : e5 06 __ SBC WORK + 3 
1e67 : 90 11 __ BCC $1e7a ; (divmod32 + 205)
1e69 : 86 09 __ STX WORK + 6 
1e6b : 85 0a __ STA WORK + 7 
1e6d : a5 07 __ LDA WORK + 4 
1e6f : e5 03 __ SBC WORK + 0 
1e71 : 85 07 __ STA WORK + 4 
1e73 : a5 08 __ LDA WORK + 5 
1e75 : e5 04 __ SBC WORK + 1 
1e77 : 85 08 __ STA WORK + 5 
1e79 : 38 __ __ SEC
1e7a : 88 __ __ DEY
1e7b : d0 cd __ BNE $1e4a ; (divmod32 + 157)
1e7d : 26 1b __ ROL ACCU + 0 
1e7f : 26 1c __ ROL ACCU + 1 
1e81 : a4 02 __ LDY $02 
1e83 : 60 __ __ RTS
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
1e84 : a9 20 __ LDA #$20
1e86 : 85 05 __ STA WORK + 2 
1e88 : a9 41 __ LDA #$41
1e8a : 85 06 __ STA WORK + 3 
1e8c : 4c 3f 19 JMP $193f ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
1e8f : a5 43 __ LDA $43 
1e91 : 85 1b __ STA ACCU + 0 
1e93 : a5 44 __ LDA $44 
1e95 : 85 1c __ STA ACCU + 1 
1e97 : a5 45 __ LDA $45 
1e99 : 85 1d __ STA ACCU + 2 
1e9b : a5 46 __ LDA $46 
1e9d : 85 1e __ STA ACCU + 3 
1e9f : 4c 2f 19 JMP $192f ; (freg + 4)
--------------------------------------------------------------------
divmod32@proxy: ; divmod32@proxy
1ea2 : a9 0a __ LDA #$0a
1ea4 : 85 03 __ STA WORK + 0 
1ea6 : 4c ad 1d JMP $1dad ; (divmod32 + 0)
--------------------------------------------------------------------
spentry:
1ea9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
fround5:
1eaa : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1eba : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
