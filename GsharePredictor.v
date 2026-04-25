module HistoryShift(
  input        clk,
  input        areset,
  input        train_taken,
  input        train_mispredicted,
  input  [6:0] train_history,
  input        predict_valid,
  input        predict_taken,
  output [6:0] predict_history
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] predict_history_r; // @[cmd3.sc 15:16]
  wire [6:0] _T_2 = {train_history[5:0],train_taken}; // @[Cat.scala 30:58]
  wire [6:0] _T_5 = {predict_history_r[5:0],predict_taken}; // @[Cat.scala 30:58]
  assign predict_history = predict_history_r; // @[cmd3.sc 24:21]
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      predict_history_r <= 7'h0;
    end else if (train_mispredicted) begin
      predict_history_r <= _T_2;
    end else if (predict_valid) begin
      predict_history_r <= _T_5;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  predict_history_r = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  if (areset) begin
    predict_history_r = 7'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Counter2bc(
  input        clk,
  input        areset,
  input        train_valid,
  input        train_taken,
  output [1:0] state
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state_r; // @[cmd2.sc 16:16]
  wire  _T_3 = train_valid & train_taken; // @[cmd2.sc 21:45]
  wire  _T_11 = train_valid & ~train_taken; // @[cmd2.sc 23:93]
  wire [1:0] _T_21 = _T_11 ? 2'h1 : 2'h2; // @[cmd2.sc 25:74]
  wire [1:0] _T_27 = _T_11 ? 2'h2 : 2'h3; // @[cmd2.sc 27:26]
  assign state = state_r; // @[cmd2.sc 32:11]
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      state_r <= 2'h1;
    end else if (state == 2'h0) begin
      if (train_valid & train_taken) begin
        state_r <= 2'h1;
      end else begin
        state_r <= 2'h0;
      end
    end else if (state == 2'h1) begin
      if (_T_3) begin
        state_r <= 2'h2;
      end else if (train_valid & ~train_taken) begin
        state_r <= 2'h0;
      end else begin
        state_r <= 2'h1;
      end
    end else if (state == 2'h2) begin
      if (_T_3) begin
        state_r <= 2'h3;
      end else begin
        state_r <= _T_21;
      end
    end else if (state == 2'h3) begin
      state_r <= _T_27;
    end else begin
      state_r <= state;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state_r = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  if (areset) begin
    state_r = 2'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GsharePredictor(
  input        clk,
  input        areset,
  input        predict_valid,
  input  [6:0] predict_pc,
  input        train_valid,
  input        train_taken,
  input        train_mispredicted,
  input  [6:0] train_history,
  input  [6:0] train_pc,
  output [6:0] predict_history,
  output       predict_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
`endif // RANDOMIZE_REG_INIT
  wire  u_gbh_clk; // @[cmd4.sc 32:23]
  wire  u_gbh_areset; // @[cmd4.sc 32:23]
  wire  u_gbh_train_taken; // @[cmd4.sc 32:23]
  wire  u_gbh_train_mispredicted; // @[cmd4.sc 32:23]
  wire [6:0] u_gbh_train_history; // @[cmd4.sc 32:23]
  wire  u_gbh_predict_valid; // @[cmd4.sc 32:23]
  wire  u_gbh_predict_taken; // @[cmd4.sc 32:23]
  wire [6:0] u_gbh_predict_history; // @[cmd4.sc 32:23]
  wire  Counter2bc_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_1_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_1_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_1_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_1_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_1_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_2_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_2_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_2_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_2_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_2_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_3_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_3_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_3_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_3_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_3_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_4_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_4_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_4_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_4_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_4_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_5_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_5_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_5_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_5_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_5_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_6_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_6_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_6_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_6_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_6_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_7_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_7_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_7_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_7_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_7_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_8_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_8_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_8_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_8_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_8_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_9_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_9_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_9_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_9_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_9_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_10_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_10_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_10_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_10_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_10_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_11_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_11_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_11_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_11_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_11_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_12_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_12_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_12_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_12_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_12_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_13_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_13_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_13_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_13_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_13_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_14_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_14_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_14_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_14_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_14_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_15_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_15_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_15_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_15_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_15_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_16_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_16_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_16_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_16_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_16_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_17_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_17_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_17_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_17_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_17_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_18_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_18_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_18_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_18_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_18_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_19_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_19_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_19_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_19_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_19_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_20_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_20_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_20_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_20_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_20_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_21_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_21_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_21_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_21_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_21_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_22_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_22_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_22_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_22_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_22_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_23_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_23_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_23_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_23_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_23_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_24_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_24_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_24_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_24_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_24_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_25_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_25_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_25_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_25_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_25_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_26_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_26_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_26_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_26_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_26_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_27_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_27_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_27_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_27_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_27_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_28_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_28_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_28_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_28_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_28_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_29_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_29_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_29_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_29_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_29_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_30_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_30_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_30_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_30_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_30_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_31_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_31_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_31_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_31_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_31_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_32_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_32_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_32_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_32_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_32_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_33_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_33_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_33_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_33_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_33_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_34_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_34_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_34_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_34_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_34_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_35_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_35_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_35_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_35_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_35_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_36_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_36_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_36_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_36_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_36_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_37_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_37_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_37_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_37_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_37_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_38_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_38_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_38_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_38_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_38_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_39_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_39_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_39_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_39_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_39_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_40_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_40_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_40_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_40_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_40_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_41_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_41_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_41_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_41_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_41_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_42_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_42_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_42_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_42_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_42_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_43_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_43_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_43_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_43_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_43_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_44_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_44_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_44_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_44_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_44_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_45_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_45_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_45_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_45_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_45_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_46_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_46_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_46_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_46_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_46_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_47_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_47_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_47_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_47_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_47_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_48_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_48_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_48_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_48_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_48_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_49_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_49_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_49_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_49_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_49_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_50_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_50_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_50_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_50_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_50_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_51_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_51_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_51_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_51_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_51_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_52_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_52_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_52_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_52_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_52_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_53_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_53_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_53_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_53_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_53_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_54_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_54_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_54_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_54_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_54_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_55_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_55_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_55_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_55_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_55_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_56_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_56_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_56_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_56_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_56_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_57_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_57_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_57_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_57_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_57_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_58_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_58_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_58_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_58_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_58_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_59_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_59_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_59_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_59_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_59_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_60_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_60_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_60_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_60_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_60_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_61_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_61_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_61_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_61_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_61_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_62_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_62_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_62_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_62_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_62_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_63_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_63_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_63_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_63_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_63_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_64_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_64_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_64_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_64_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_64_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_65_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_65_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_65_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_65_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_65_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_66_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_66_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_66_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_66_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_66_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_67_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_67_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_67_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_67_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_67_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_68_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_68_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_68_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_68_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_68_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_69_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_69_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_69_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_69_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_69_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_70_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_70_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_70_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_70_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_70_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_71_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_71_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_71_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_71_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_71_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_72_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_72_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_72_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_72_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_72_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_73_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_73_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_73_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_73_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_73_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_74_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_74_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_74_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_74_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_74_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_75_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_75_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_75_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_75_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_75_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_76_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_76_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_76_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_76_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_76_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_77_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_77_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_77_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_77_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_77_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_78_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_78_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_78_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_78_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_78_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_79_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_79_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_79_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_79_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_79_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_80_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_80_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_80_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_80_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_80_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_81_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_81_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_81_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_81_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_81_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_82_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_82_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_82_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_82_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_82_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_83_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_83_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_83_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_83_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_83_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_84_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_84_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_84_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_84_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_84_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_85_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_85_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_85_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_85_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_85_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_86_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_86_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_86_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_86_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_86_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_87_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_87_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_87_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_87_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_87_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_88_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_88_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_88_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_88_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_88_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_89_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_89_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_89_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_89_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_89_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_90_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_90_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_90_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_90_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_90_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_91_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_91_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_91_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_91_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_91_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_92_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_92_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_92_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_92_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_92_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_93_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_93_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_93_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_93_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_93_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_94_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_94_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_94_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_94_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_94_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_95_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_95_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_95_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_95_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_95_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_96_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_96_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_96_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_96_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_96_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_97_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_97_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_97_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_97_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_97_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_98_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_98_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_98_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_98_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_98_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_99_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_99_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_99_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_99_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_99_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_100_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_100_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_100_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_100_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_100_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_101_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_101_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_101_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_101_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_101_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_102_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_102_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_102_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_102_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_102_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_103_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_103_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_103_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_103_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_103_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_104_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_104_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_104_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_104_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_104_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_105_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_105_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_105_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_105_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_105_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_106_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_106_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_106_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_106_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_106_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_107_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_107_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_107_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_107_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_107_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_108_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_108_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_108_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_108_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_108_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_109_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_109_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_109_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_109_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_109_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_110_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_110_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_110_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_110_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_110_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_111_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_111_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_111_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_111_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_111_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_112_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_112_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_112_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_112_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_112_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_113_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_113_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_113_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_113_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_113_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_114_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_114_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_114_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_114_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_114_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_115_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_115_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_115_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_115_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_115_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_116_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_116_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_116_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_116_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_116_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_117_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_117_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_117_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_117_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_117_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_118_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_118_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_118_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_118_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_118_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_119_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_119_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_119_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_119_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_119_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_120_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_120_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_120_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_120_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_120_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_121_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_121_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_121_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_121_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_121_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_122_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_122_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_122_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_122_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_122_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_123_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_123_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_123_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_123_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_123_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_124_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_124_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_124_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_124_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_124_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_125_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_125_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_125_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_125_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_125_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_126_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_126_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_126_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_126_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_126_state; // @[cmd4.sc 55:27]
  wire  Counter2bc_127_clk; // @[cmd4.sc 55:27]
  wire  Counter2bc_127_areset; // @[cmd4.sc 55:27]
  wire  Counter2bc_127_train_valid; // @[cmd4.sc 55:27]
  wire  Counter2bc_127_train_taken; // @[cmd4.sc 55:27]
  wire [1:0] Counter2bc_127_state; // @[cmd4.sc 55:27]
  reg [1:0] PHT_0; // @[cmd4.sc 24:16]
  reg [1:0] PHT_1; // @[cmd4.sc 24:16]
  reg [1:0] PHT_2; // @[cmd4.sc 24:16]
  reg [1:0] PHT_3; // @[cmd4.sc 24:16]
  reg [1:0] PHT_4; // @[cmd4.sc 24:16]
  reg [1:0] PHT_5; // @[cmd4.sc 24:16]
  reg [1:0] PHT_6; // @[cmd4.sc 24:16]
  reg [1:0] PHT_7; // @[cmd4.sc 24:16]
  reg [1:0] PHT_8; // @[cmd4.sc 24:16]
  reg [1:0] PHT_9; // @[cmd4.sc 24:16]
  reg [1:0] PHT_10; // @[cmd4.sc 24:16]
  reg [1:0] PHT_11; // @[cmd4.sc 24:16]
  reg [1:0] PHT_12; // @[cmd4.sc 24:16]
  reg [1:0] PHT_13; // @[cmd4.sc 24:16]
  reg [1:0] PHT_14; // @[cmd4.sc 24:16]
  reg [1:0] PHT_15; // @[cmd4.sc 24:16]
  reg [1:0] PHT_16; // @[cmd4.sc 24:16]
  reg [1:0] PHT_17; // @[cmd4.sc 24:16]
  reg [1:0] PHT_18; // @[cmd4.sc 24:16]
  reg [1:0] PHT_19; // @[cmd4.sc 24:16]
  reg [1:0] PHT_20; // @[cmd4.sc 24:16]
  reg [1:0] PHT_21; // @[cmd4.sc 24:16]
  reg [1:0] PHT_22; // @[cmd4.sc 24:16]
  reg [1:0] PHT_23; // @[cmd4.sc 24:16]
  reg [1:0] PHT_24; // @[cmd4.sc 24:16]
  reg [1:0] PHT_25; // @[cmd4.sc 24:16]
  reg [1:0] PHT_26; // @[cmd4.sc 24:16]
  reg [1:0] PHT_27; // @[cmd4.sc 24:16]
  reg [1:0] PHT_28; // @[cmd4.sc 24:16]
  reg [1:0] PHT_29; // @[cmd4.sc 24:16]
  reg [1:0] PHT_30; // @[cmd4.sc 24:16]
  reg [1:0] PHT_31; // @[cmd4.sc 24:16]
  reg [1:0] PHT_32; // @[cmd4.sc 24:16]
  reg [1:0] PHT_33; // @[cmd4.sc 24:16]
  reg [1:0] PHT_34; // @[cmd4.sc 24:16]
  reg [1:0] PHT_35; // @[cmd4.sc 24:16]
  reg [1:0] PHT_36; // @[cmd4.sc 24:16]
  reg [1:0] PHT_37; // @[cmd4.sc 24:16]
  reg [1:0] PHT_38; // @[cmd4.sc 24:16]
  reg [1:0] PHT_39; // @[cmd4.sc 24:16]
  reg [1:0] PHT_40; // @[cmd4.sc 24:16]
  reg [1:0] PHT_41; // @[cmd4.sc 24:16]
  reg [1:0] PHT_42; // @[cmd4.sc 24:16]
  reg [1:0] PHT_43; // @[cmd4.sc 24:16]
  reg [1:0] PHT_44; // @[cmd4.sc 24:16]
  reg [1:0] PHT_45; // @[cmd4.sc 24:16]
  reg [1:0] PHT_46; // @[cmd4.sc 24:16]
  reg [1:0] PHT_47; // @[cmd4.sc 24:16]
  reg [1:0] PHT_48; // @[cmd4.sc 24:16]
  reg [1:0] PHT_49; // @[cmd4.sc 24:16]
  reg [1:0] PHT_50; // @[cmd4.sc 24:16]
  reg [1:0] PHT_51; // @[cmd4.sc 24:16]
  reg [1:0] PHT_52; // @[cmd4.sc 24:16]
  reg [1:0] PHT_53; // @[cmd4.sc 24:16]
  reg [1:0] PHT_54; // @[cmd4.sc 24:16]
  reg [1:0] PHT_55; // @[cmd4.sc 24:16]
  reg [1:0] PHT_56; // @[cmd4.sc 24:16]
  reg [1:0] PHT_57; // @[cmd4.sc 24:16]
  reg [1:0] PHT_58; // @[cmd4.sc 24:16]
  reg [1:0] PHT_59; // @[cmd4.sc 24:16]
  reg [1:0] PHT_60; // @[cmd4.sc 24:16]
  reg [1:0] PHT_61; // @[cmd4.sc 24:16]
  reg [1:0] PHT_62; // @[cmd4.sc 24:16]
  reg [1:0] PHT_63; // @[cmd4.sc 24:16]
  reg [1:0] PHT_64; // @[cmd4.sc 24:16]
  reg [1:0] PHT_65; // @[cmd4.sc 24:16]
  reg [1:0] PHT_66; // @[cmd4.sc 24:16]
  reg [1:0] PHT_67; // @[cmd4.sc 24:16]
  reg [1:0] PHT_68; // @[cmd4.sc 24:16]
  reg [1:0] PHT_69; // @[cmd4.sc 24:16]
  reg [1:0] PHT_70; // @[cmd4.sc 24:16]
  reg [1:0] PHT_71; // @[cmd4.sc 24:16]
  reg [1:0] PHT_72; // @[cmd4.sc 24:16]
  reg [1:0] PHT_73; // @[cmd4.sc 24:16]
  reg [1:0] PHT_74; // @[cmd4.sc 24:16]
  reg [1:0] PHT_75; // @[cmd4.sc 24:16]
  reg [1:0] PHT_76; // @[cmd4.sc 24:16]
  reg [1:0] PHT_77; // @[cmd4.sc 24:16]
  reg [1:0] PHT_78; // @[cmd4.sc 24:16]
  reg [1:0] PHT_79; // @[cmd4.sc 24:16]
  reg [1:0] PHT_80; // @[cmd4.sc 24:16]
  reg [1:0] PHT_81; // @[cmd4.sc 24:16]
  reg [1:0] PHT_82; // @[cmd4.sc 24:16]
  reg [1:0] PHT_83; // @[cmd4.sc 24:16]
  reg [1:0] PHT_84; // @[cmd4.sc 24:16]
  reg [1:0] PHT_85; // @[cmd4.sc 24:16]
  reg [1:0] PHT_86; // @[cmd4.sc 24:16]
  reg [1:0] PHT_87; // @[cmd4.sc 24:16]
  reg [1:0] PHT_88; // @[cmd4.sc 24:16]
  reg [1:0] PHT_89; // @[cmd4.sc 24:16]
  reg [1:0] PHT_90; // @[cmd4.sc 24:16]
  reg [1:0] PHT_91; // @[cmd4.sc 24:16]
  reg [1:0] PHT_92; // @[cmd4.sc 24:16]
  reg [1:0] PHT_93; // @[cmd4.sc 24:16]
  reg [1:0] PHT_94; // @[cmd4.sc 24:16]
  reg [1:0] PHT_95; // @[cmd4.sc 24:16]
  reg [1:0] PHT_96; // @[cmd4.sc 24:16]
  reg [1:0] PHT_97; // @[cmd4.sc 24:16]
  reg [1:0] PHT_98; // @[cmd4.sc 24:16]
  reg [1:0] PHT_99; // @[cmd4.sc 24:16]
  reg [1:0] PHT_100; // @[cmd4.sc 24:16]
  reg [1:0] PHT_101; // @[cmd4.sc 24:16]
  reg [1:0] PHT_102; // @[cmd4.sc 24:16]
  reg [1:0] PHT_103; // @[cmd4.sc 24:16]
  reg [1:0] PHT_104; // @[cmd4.sc 24:16]
  reg [1:0] PHT_105; // @[cmd4.sc 24:16]
  reg [1:0] PHT_106; // @[cmd4.sc 24:16]
  reg [1:0] PHT_107; // @[cmd4.sc 24:16]
  reg [1:0] PHT_108; // @[cmd4.sc 24:16]
  reg [1:0] PHT_109; // @[cmd4.sc 24:16]
  reg [1:0] PHT_110; // @[cmd4.sc 24:16]
  reg [1:0] PHT_111; // @[cmd4.sc 24:16]
  reg [1:0] PHT_112; // @[cmd4.sc 24:16]
  reg [1:0] PHT_113; // @[cmd4.sc 24:16]
  reg [1:0] PHT_114; // @[cmd4.sc 24:16]
  reg [1:0] PHT_115; // @[cmd4.sc 24:16]
  reg [1:0] PHT_116; // @[cmd4.sc 24:16]
  reg [1:0] PHT_117; // @[cmd4.sc 24:16]
  reg [1:0] PHT_118; // @[cmd4.sc 24:16]
  reg [1:0] PHT_119; // @[cmd4.sc 24:16]
  reg [1:0] PHT_120; // @[cmd4.sc 24:16]
  reg [1:0] PHT_121; // @[cmd4.sc 24:16]
  reg [1:0] PHT_122; // @[cmd4.sc 24:16]
  reg [1:0] PHT_123; // @[cmd4.sc 24:16]
  reg [1:0] PHT_124; // @[cmd4.sc 24:16]
  reg [1:0] PHT_125; // @[cmd4.sc 24:16]
  reg [1:0] PHT_126; // @[cmd4.sc 24:16]
  reg [1:0] PHT_127; // @[cmd4.sc 24:16]
  reg [6:0] BTB_0; // @[cmd4.sc 28:16]
  reg [6:0] BTB_1; // @[cmd4.sc 28:16]
  reg [6:0] BTB_2; // @[cmd4.sc 28:16]
  reg [6:0] BTB_3; // @[cmd4.sc 28:16]
  reg [6:0] BTB_4; // @[cmd4.sc 28:16]
  reg [6:0] BTB_5; // @[cmd4.sc 28:16]
  reg [6:0] BTB_6; // @[cmd4.sc 28:16]
  reg [6:0] BTB_7; // @[cmd4.sc 28:16]
  reg [6:0] BTB_8; // @[cmd4.sc 28:16]
  reg [6:0] BTB_9; // @[cmd4.sc 28:16]
  reg [6:0] BTB_10; // @[cmd4.sc 28:16]
  reg [6:0] BTB_11; // @[cmd4.sc 28:16]
  reg [6:0] BTB_12; // @[cmd4.sc 28:16]
  reg [6:0] BTB_13; // @[cmd4.sc 28:16]
  reg [6:0] BTB_14; // @[cmd4.sc 28:16]
  reg [6:0] BTB_15; // @[cmd4.sc 28:16]
  reg [6:0] BTB_16; // @[cmd4.sc 28:16]
  reg [6:0] BTB_17; // @[cmd4.sc 28:16]
  reg [6:0] BTB_18; // @[cmd4.sc 28:16]
  reg [6:0] BTB_19; // @[cmd4.sc 28:16]
  reg [6:0] BTB_20; // @[cmd4.sc 28:16]
  reg [6:0] BTB_21; // @[cmd4.sc 28:16]
  reg [6:0] BTB_22; // @[cmd4.sc 28:16]
  reg [6:0] BTB_23; // @[cmd4.sc 28:16]
  reg [6:0] BTB_24; // @[cmd4.sc 28:16]
  reg [6:0] BTB_25; // @[cmd4.sc 28:16]
  reg [6:0] BTB_26; // @[cmd4.sc 28:16]
  reg [6:0] BTB_27; // @[cmd4.sc 28:16]
  reg [6:0] BTB_28; // @[cmd4.sc 28:16]
  reg [6:0] BTB_29; // @[cmd4.sc 28:16]
  reg [6:0] BTB_30; // @[cmd4.sc 28:16]
  reg [6:0] BTB_31; // @[cmd4.sc 28:16]
  reg [6:0] BTB_32; // @[cmd4.sc 28:16]
  reg [6:0] BTB_33; // @[cmd4.sc 28:16]
  reg [6:0] BTB_34; // @[cmd4.sc 28:16]
  reg [6:0] BTB_35; // @[cmd4.sc 28:16]
  reg [6:0] BTB_36; // @[cmd4.sc 28:16]
  reg [6:0] BTB_37; // @[cmd4.sc 28:16]
  reg [6:0] BTB_38; // @[cmd4.sc 28:16]
  reg [6:0] BTB_39; // @[cmd4.sc 28:16]
  reg [6:0] BTB_40; // @[cmd4.sc 28:16]
  reg [6:0] BTB_41; // @[cmd4.sc 28:16]
  reg [6:0] BTB_42; // @[cmd4.sc 28:16]
  reg [6:0] BTB_43; // @[cmd4.sc 28:16]
  reg [6:0] BTB_44; // @[cmd4.sc 28:16]
  reg [6:0] BTB_45; // @[cmd4.sc 28:16]
  reg [6:0] BTB_46; // @[cmd4.sc 28:16]
  reg [6:0] BTB_47; // @[cmd4.sc 28:16]
  reg [6:0] BTB_48; // @[cmd4.sc 28:16]
  reg [6:0] BTB_49; // @[cmd4.sc 28:16]
  reg [6:0] BTB_50; // @[cmd4.sc 28:16]
  reg [6:0] BTB_51; // @[cmd4.sc 28:16]
  reg [6:0] BTB_52; // @[cmd4.sc 28:16]
  reg [6:0] BTB_53; // @[cmd4.sc 28:16]
  reg [6:0] BTB_54; // @[cmd4.sc 28:16]
  reg [6:0] BTB_55; // @[cmd4.sc 28:16]
  reg [6:0] BTB_56; // @[cmd4.sc 28:16]
  reg [6:0] BTB_57; // @[cmd4.sc 28:16]
  reg [6:0] BTB_58; // @[cmd4.sc 28:16]
  reg [6:0] BTB_59; // @[cmd4.sc 28:16]
  reg [6:0] BTB_60; // @[cmd4.sc 28:16]
  reg [6:0] BTB_61; // @[cmd4.sc 28:16]
  reg [6:0] BTB_62; // @[cmd4.sc 28:16]
  reg [6:0] BTB_63; // @[cmd4.sc 28:16]
  reg [6:0] BTB_64; // @[cmd4.sc 28:16]
  reg [6:0] BTB_65; // @[cmd4.sc 28:16]
  reg [6:0] BTB_66; // @[cmd4.sc 28:16]
  reg [6:0] BTB_67; // @[cmd4.sc 28:16]
  reg [6:0] BTB_68; // @[cmd4.sc 28:16]
  reg [6:0] BTB_69; // @[cmd4.sc 28:16]
  reg [6:0] BTB_70; // @[cmd4.sc 28:16]
  reg [6:0] BTB_71; // @[cmd4.sc 28:16]
  reg [6:0] BTB_72; // @[cmd4.sc 28:16]
  reg [6:0] BTB_73; // @[cmd4.sc 28:16]
  reg [6:0] BTB_74; // @[cmd4.sc 28:16]
  reg [6:0] BTB_75; // @[cmd4.sc 28:16]
  reg [6:0] BTB_76; // @[cmd4.sc 28:16]
  reg [6:0] BTB_77; // @[cmd4.sc 28:16]
  reg [6:0] BTB_78; // @[cmd4.sc 28:16]
  reg [6:0] BTB_79; // @[cmd4.sc 28:16]
  reg [6:0] BTB_80; // @[cmd4.sc 28:16]
  reg [6:0] BTB_81; // @[cmd4.sc 28:16]
  reg [6:0] BTB_82; // @[cmd4.sc 28:16]
  reg [6:0] BTB_83; // @[cmd4.sc 28:16]
  reg [6:0] BTB_84; // @[cmd4.sc 28:16]
  reg [6:0] BTB_85; // @[cmd4.sc 28:16]
  reg [6:0] BTB_86; // @[cmd4.sc 28:16]
  reg [6:0] BTB_87; // @[cmd4.sc 28:16]
  reg [6:0] BTB_88; // @[cmd4.sc 28:16]
  reg [6:0] BTB_89; // @[cmd4.sc 28:16]
  reg [6:0] BTB_90; // @[cmd4.sc 28:16]
  reg [6:0] BTB_91; // @[cmd4.sc 28:16]
  reg [6:0] BTB_92; // @[cmd4.sc 28:16]
  reg [6:0] BTB_93; // @[cmd4.sc 28:16]
  reg [6:0] BTB_94; // @[cmd4.sc 28:16]
  reg [6:0] BTB_95; // @[cmd4.sc 28:16]
  reg [6:0] BTB_96; // @[cmd4.sc 28:16]
  reg [6:0] BTB_97; // @[cmd4.sc 28:16]
  reg [6:0] BTB_98; // @[cmd4.sc 28:16]
  reg [6:0] BTB_99; // @[cmd4.sc 28:16]
  reg [6:0] BTB_100; // @[cmd4.sc 28:16]
  reg [6:0] BTB_101; // @[cmd4.sc 28:16]
  reg [6:0] BTB_102; // @[cmd4.sc 28:16]
  reg [6:0] BTB_103; // @[cmd4.sc 28:16]
  reg [6:0] BTB_104; // @[cmd4.sc 28:16]
  reg [6:0] BTB_105; // @[cmd4.sc 28:16]
  reg [6:0] BTB_106; // @[cmd4.sc 28:16]
  reg [6:0] BTB_107; // @[cmd4.sc 28:16]
  reg [6:0] BTB_108; // @[cmd4.sc 28:16]
  reg [6:0] BTB_109; // @[cmd4.sc 28:16]
  reg [6:0] BTB_110; // @[cmd4.sc 28:16]
  reg [6:0] BTB_111; // @[cmd4.sc 28:16]
  reg [6:0] BTB_112; // @[cmd4.sc 28:16]
  reg [6:0] BTB_113; // @[cmd4.sc 28:16]
  reg [6:0] BTB_114; // @[cmd4.sc 28:16]
  reg [6:0] BTB_115; // @[cmd4.sc 28:16]
  reg [6:0] BTB_116; // @[cmd4.sc 28:16]
  reg [6:0] BTB_117; // @[cmd4.sc 28:16]
  reg [6:0] BTB_118; // @[cmd4.sc 28:16]
  reg [6:0] BTB_119; // @[cmd4.sc 28:16]
  reg [6:0] BTB_120; // @[cmd4.sc 28:16]
  reg [6:0] BTB_121; // @[cmd4.sc 28:16]
  reg [6:0] BTB_122; // @[cmd4.sc 28:16]
  reg [6:0] BTB_123; // @[cmd4.sc 28:16]
  reg [6:0] BTB_124; // @[cmd4.sc 28:16]
  reg [6:0] BTB_125; // @[cmd4.sc 28:16]
  reg [6:0] BTB_126; // @[cmd4.sc 28:16]
  reg [6:0] BTB_127; // @[cmd4.sc 28:16]
  wire [6:0] gbh = u_gbh_predict_history; // @[cmd4.sc 34:19 cmd4.sc 42:9]
  wire [6:0] pht_index = predict_pc & gbh; // @[cmd4.sc 43:32]
  wire [1:0] _GEN_1 = 7'h1 == pht_index ? PHT_1 : PHT_0; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_2 = 7'h2 == pht_index ? PHT_2 : _GEN_1; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_3 = 7'h3 == pht_index ? PHT_3 : _GEN_2; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_4 = 7'h4 == pht_index ? PHT_4 : _GEN_3; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_5 = 7'h5 == pht_index ? PHT_5 : _GEN_4; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_6 = 7'h6 == pht_index ? PHT_6 : _GEN_5; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_7 = 7'h7 == pht_index ? PHT_7 : _GEN_6; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_8 = 7'h8 == pht_index ? PHT_8 : _GEN_7; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_9 = 7'h9 == pht_index ? PHT_9 : _GEN_8; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_10 = 7'ha == pht_index ? PHT_10 : _GEN_9; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_11 = 7'hb == pht_index ? PHT_11 : _GEN_10; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_12 = 7'hc == pht_index ? PHT_12 : _GEN_11; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_13 = 7'hd == pht_index ? PHT_13 : _GEN_12; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_14 = 7'he == pht_index ? PHT_14 : _GEN_13; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_15 = 7'hf == pht_index ? PHT_15 : _GEN_14; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_16 = 7'h10 == pht_index ? PHT_16 : _GEN_15; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_17 = 7'h11 == pht_index ? PHT_17 : _GEN_16; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_18 = 7'h12 == pht_index ? PHT_18 : _GEN_17; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_19 = 7'h13 == pht_index ? PHT_19 : _GEN_18; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_20 = 7'h14 == pht_index ? PHT_20 : _GEN_19; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_21 = 7'h15 == pht_index ? PHT_21 : _GEN_20; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_22 = 7'h16 == pht_index ? PHT_22 : _GEN_21; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_23 = 7'h17 == pht_index ? PHT_23 : _GEN_22; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_24 = 7'h18 == pht_index ? PHT_24 : _GEN_23; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_25 = 7'h19 == pht_index ? PHT_25 : _GEN_24; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_26 = 7'h1a == pht_index ? PHT_26 : _GEN_25; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_27 = 7'h1b == pht_index ? PHT_27 : _GEN_26; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_28 = 7'h1c == pht_index ? PHT_28 : _GEN_27; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_29 = 7'h1d == pht_index ? PHT_29 : _GEN_28; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_30 = 7'h1e == pht_index ? PHT_30 : _GEN_29; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_31 = 7'h1f == pht_index ? PHT_31 : _GEN_30; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_32 = 7'h20 == pht_index ? PHT_32 : _GEN_31; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_33 = 7'h21 == pht_index ? PHT_33 : _GEN_32; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_34 = 7'h22 == pht_index ? PHT_34 : _GEN_33; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_35 = 7'h23 == pht_index ? PHT_35 : _GEN_34; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_36 = 7'h24 == pht_index ? PHT_36 : _GEN_35; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_37 = 7'h25 == pht_index ? PHT_37 : _GEN_36; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_38 = 7'h26 == pht_index ? PHT_38 : _GEN_37; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_39 = 7'h27 == pht_index ? PHT_39 : _GEN_38; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_40 = 7'h28 == pht_index ? PHT_40 : _GEN_39; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_41 = 7'h29 == pht_index ? PHT_41 : _GEN_40; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_42 = 7'h2a == pht_index ? PHT_42 : _GEN_41; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_43 = 7'h2b == pht_index ? PHT_43 : _GEN_42; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_44 = 7'h2c == pht_index ? PHT_44 : _GEN_43; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_45 = 7'h2d == pht_index ? PHT_45 : _GEN_44; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_46 = 7'h2e == pht_index ? PHT_46 : _GEN_45; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_47 = 7'h2f == pht_index ? PHT_47 : _GEN_46; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_48 = 7'h30 == pht_index ? PHT_48 : _GEN_47; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_49 = 7'h31 == pht_index ? PHT_49 : _GEN_48; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_50 = 7'h32 == pht_index ? PHT_50 : _GEN_49; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_51 = 7'h33 == pht_index ? PHT_51 : _GEN_50; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_52 = 7'h34 == pht_index ? PHT_52 : _GEN_51; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_53 = 7'h35 == pht_index ? PHT_53 : _GEN_52; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_54 = 7'h36 == pht_index ? PHT_54 : _GEN_53; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_55 = 7'h37 == pht_index ? PHT_55 : _GEN_54; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_56 = 7'h38 == pht_index ? PHT_56 : _GEN_55; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_57 = 7'h39 == pht_index ? PHT_57 : _GEN_56; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_58 = 7'h3a == pht_index ? PHT_58 : _GEN_57; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_59 = 7'h3b == pht_index ? PHT_59 : _GEN_58; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_60 = 7'h3c == pht_index ? PHT_60 : _GEN_59; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_61 = 7'h3d == pht_index ? PHT_61 : _GEN_60; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_62 = 7'h3e == pht_index ? PHT_62 : _GEN_61; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_63 = 7'h3f == pht_index ? PHT_63 : _GEN_62; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_64 = 7'h40 == pht_index ? PHT_64 : _GEN_63; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_65 = 7'h41 == pht_index ? PHT_65 : _GEN_64; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_66 = 7'h42 == pht_index ? PHT_66 : _GEN_65; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_67 = 7'h43 == pht_index ? PHT_67 : _GEN_66; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_68 = 7'h44 == pht_index ? PHT_68 : _GEN_67; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_69 = 7'h45 == pht_index ? PHT_69 : _GEN_68; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_70 = 7'h46 == pht_index ? PHT_70 : _GEN_69; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_71 = 7'h47 == pht_index ? PHT_71 : _GEN_70; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_72 = 7'h48 == pht_index ? PHT_72 : _GEN_71; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_73 = 7'h49 == pht_index ? PHT_73 : _GEN_72; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_74 = 7'h4a == pht_index ? PHT_74 : _GEN_73; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_75 = 7'h4b == pht_index ? PHT_75 : _GEN_74; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_76 = 7'h4c == pht_index ? PHT_76 : _GEN_75; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_77 = 7'h4d == pht_index ? PHT_77 : _GEN_76; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_78 = 7'h4e == pht_index ? PHT_78 : _GEN_77; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_79 = 7'h4f == pht_index ? PHT_79 : _GEN_78; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_80 = 7'h50 == pht_index ? PHT_80 : _GEN_79; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_81 = 7'h51 == pht_index ? PHT_81 : _GEN_80; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_82 = 7'h52 == pht_index ? PHT_82 : _GEN_81; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_83 = 7'h53 == pht_index ? PHT_83 : _GEN_82; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_84 = 7'h54 == pht_index ? PHT_84 : _GEN_83; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_85 = 7'h55 == pht_index ? PHT_85 : _GEN_84; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_86 = 7'h56 == pht_index ? PHT_86 : _GEN_85; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_87 = 7'h57 == pht_index ? PHT_87 : _GEN_86; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_88 = 7'h58 == pht_index ? PHT_88 : _GEN_87; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_89 = 7'h59 == pht_index ? PHT_89 : _GEN_88; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_90 = 7'h5a == pht_index ? PHT_90 : _GEN_89; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_91 = 7'h5b == pht_index ? PHT_91 : _GEN_90; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_92 = 7'h5c == pht_index ? PHT_92 : _GEN_91; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_93 = 7'h5d == pht_index ? PHT_93 : _GEN_92; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_94 = 7'h5e == pht_index ? PHT_94 : _GEN_93; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_95 = 7'h5f == pht_index ? PHT_95 : _GEN_94; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_96 = 7'h60 == pht_index ? PHT_96 : _GEN_95; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_97 = 7'h61 == pht_index ? PHT_97 : _GEN_96; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_98 = 7'h62 == pht_index ? PHT_98 : _GEN_97; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_99 = 7'h63 == pht_index ? PHT_99 : _GEN_98; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_100 = 7'h64 == pht_index ? PHT_100 : _GEN_99; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_101 = 7'h65 == pht_index ? PHT_101 : _GEN_100; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_102 = 7'h66 == pht_index ? PHT_102 : _GEN_101; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_103 = 7'h67 == pht_index ? PHT_103 : _GEN_102; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_104 = 7'h68 == pht_index ? PHT_104 : _GEN_103; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_105 = 7'h69 == pht_index ? PHT_105 : _GEN_104; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_106 = 7'h6a == pht_index ? PHT_106 : _GEN_105; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_107 = 7'h6b == pht_index ? PHT_107 : _GEN_106; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_108 = 7'h6c == pht_index ? PHT_108 : _GEN_107; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_109 = 7'h6d == pht_index ? PHT_109 : _GEN_108; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_110 = 7'h6e == pht_index ? PHT_110 : _GEN_109; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_111 = 7'h6f == pht_index ? PHT_111 : _GEN_110; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_112 = 7'h70 == pht_index ? PHT_112 : _GEN_111; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_113 = 7'h71 == pht_index ? PHT_113 : _GEN_112; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_114 = 7'h72 == pht_index ? PHT_114 : _GEN_113; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_115 = 7'h73 == pht_index ? PHT_115 : _GEN_114; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_116 = 7'h74 == pht_index ? PHT_116 : _GEN_115; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_117 = 7'h75 == pht_index ? PHT_117 : _GEN_116; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_118 = 7'h76 == pht_index ? PHT_118 : _GEN_117; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_119 = 7'h77 == pht_index ? PHT_119 : _GEN_118; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_120 = 7'h78 == pht_index ? PHT_120 : _GEN_119; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_121 = 7'h79 == pht_index ? PHT_121 : _GEN_120; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_122 = 7'h7a == pht_index ? PHT_122 : _GEN_121; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_123 = 7'h7b == pht_index ? PHT_123 : _GEN_122; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_124 = 7'h7c == pht_index ? PHT_124 : _GEN_123; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_125 = 7'h7d == pht_index ? PHT_125 : _GEN_124; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_126 = 7'h7e == pht_index ? PHT_126 : _GEN_125; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [1:0] _GEN_127 = 7'h7f == pht_index ? PHT_127 : _GEN_126; // @[cmd4.sc 45:40 cmd4.sc 45:40]
  wire [6:0] _GEN_129 = 7'h1 == pht_index ? BTB_1 : BTB_0; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_130 = 7'h2 == pht_index ? BTB_2 : _GEN_129; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_131 = 7'h3 == pht_index ? BTB_3 : _GEN_130; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_132 = 7'h4 == pht_index ? BTB_4 : _GEN_131; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_133 = 7'h5 == pht_index ? BTB_5 : _GEN_132; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_134 = 7'h6 == pht_index ? BTB_6 : _GEN_133; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_135 = 7'h7 == pht_index ? BTB_7 : _GEN_134; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_136 = 7'h8 == pht_index ? BTB_8 : _GEN_135; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_137 = 7'h9 == pht_index ? BTB_9 : _GEN_136; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_138 = 7'ha == pht_index ? BTB_10 : _GEN_137; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_139 = 7'hb == pht_index ? BTB_11 : _GEN_138; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_140 = 7'hc == pht_index ? BTB_12 : _GEN_139; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_141 = 7'hd == pht_index ? BTB_13 : _GEN_140; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_142 = 7'he == pht_index ? BTB_14 : _GEN_141; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_143 = 7'hf == pht_index ? BTB_15 : _GEN_142; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_144 = 7'h10 == pht_index ? BTB_16 : _GEN_143; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_145 = 7'h11 == pht_index ? BTB_17 : _GEN_144; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_146 = 7'h12 == pht_index ? BTB_18 : _GEN_145; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_147 = 7'h13 == pht_index ? BTB_19 : _GEN_146; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_148 = 7'h14 == pht_index ? BTB_20 : _GEN_147; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_149 = 7'h15 == pht_index ? BTB_21 : _GEN_148; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_150 = 7'h16 == pht_index ? BTB_22 : _GEN_149; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_151 = 7'h17 == pht_index ? BTB_23 : _GEN_150; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_152 = 7'h18 == pht_index ? BTB_24 : _GEN_151; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_153 = 7'h19 == pht_index ? BTB_25 : _GEN_152; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_154 = 7'h1a == pht_index ? BTB_26 : _GEN_153; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_155 = 7'h1b == pht_index ? BTB_27 : _GEN_154; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_156 = 7'h1c == pht_index ? BTB_28 : _GEN_155; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_157 = 7'h1d == pht_index ? BTB_29 : _GEN_156; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_158 = 7'h1e == pht_index ? BTB_30 : _GEN_157; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_159 = 7'h1f == pht_index ? BTB_31 : _GEN_158; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_160 = 7'h20 == pht_index ? BTB_32 : _GEN_159; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_161 = 7'h21 == pht_index ? BTB_33 : _GEN_160; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_162 = 7'h22 == pht_index ? BTB_34 : _GEN_161; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_163 = 7'h23 == pht_index ? BTB_35 : _GEN_162; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_164 = 7'h24 == pht_index ? BTB_36 : _GEN_163; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_165 = 7'h25 == pht_index ? BTB_37 : _GEN_164; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_166 = 7'h26 == pht_index ? BTB_38 : _GEN_165; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_167 = 7'h27 == pht_index ? BTB_39 : _GEN_166; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_168 = 7'h28 == pht_index ? BTB_40 : _GEN_167; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_169 = 7'h29 == pht_index ? BTB_41 : _GEN_168; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_170 = 7'h2a == pht_index ? BTB_42 : _GEN_169; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_171 = 7'h2b == pht_index ? BTB_43 : _GEN_170; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_172 = 7'h2c == pht_index ? BTB_44 : _GEN_171; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_173 = 7'h2d == pht_index ? BTB_45 : _GEN_172; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_174 = 7'h2e == pht_index ? BTB_46 : _GEN_173; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_175 = 7'h2f == pht_index ? BTB_47 : _GEN_174; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_176 = 7'h30 == pht_index ? BTB_48 : _GEN_175; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_177 = 7'h31 == pht_index ? BTB_49 : _GEN_176; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_178 = 7'h32 == pht_index ? BTB_50 : _GEN_177; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_179 = 7'h33 == pht_index ? BTB_51 : _GEN_178; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_180 = 7'h34 == pht_index ? BTB_52 : _GEN_179; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_181 = 7'h35 == pht_index ? BTB_53 : _GEN_180; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_182 = 7'h36 == pht_index ? BTB_54 : _GEN_181; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_183 = 7'h37 == pht_index ? BTB_55 : _GEN_182; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_184 = 7'h38 == pht_index ? BTB_56 : _GEN_183; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_185 = 7'h39 == pht_index ? BTB_57 : _GEN_184; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_186 = 7'h3a == pht_index ? BTB_58 : _GEN_185; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_187 = 7'h3b == pht_index ? BTB_59 : _GEN_186; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_188 = 7'h3c == pht_index ? BTB_60 : _GEN_187; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_189 = 7'h3d == pht_index ? BTB_61 : _GEN_188; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_190 = 7'h3e == pht_index ? BTB_62 : _GEN_189; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_191 = 7'h3f == pht_index ? BTB_63 : _GEN_190; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_192 = 7'h40 == pht_index ? BTB_64 : _GEN_191; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_193 = 7'h41 == pht_index ? BTB_65 : _GEN_192; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_194 = 7'h42 == pht_index ? BTB_66 : _GEN_193; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_195 = 7'h43 == pht_index ? BTB_67 : _GEN_194; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_196 = 7'h44 == pht_index ? BTB_68 : _GEN_195; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_197 = 7'h45 == pht_index ? BTB_69 : _GEN_196; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_198 = 7'h46 == pht_index ? BTB_70 : _GEN_197; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_199 = 7'h47 == pht_index ? BTB_71 : _GEN_198; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_200 = 7'h48 == pht_index ? BTB_72 : _GEN_199; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_201 = 7'h49 == pht_index ? BTB_73 : _GEN_200; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_202 = 7'h4a == pht_index ? BTB_74 : _GEN_201; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_203 = 7'h4b == pht_index ? BTB_75 : _GEN_202; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_204 = 7'h4c == pht_index ? BTB_76 : _GEN_203; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_205 = 7'h4d == pht_index ? BTB_77 : _GEN_204; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_206 = 7'h4e == pht_index ? BTB_78 : _GEN_205; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_207 = 7'h4f == pht_index ? BTB_79 : _GEN_206; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_208 = 7'h50 == pht_index ? BTB_80 : _GEN_207; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_209 = 7'h51 == pht_index ? BTB_81 : _GEN_208; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_210 = 7'h52 == pht_index ? BTB_82 : _GEN_209; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_211 = 7'h53 == pht_index ? BTB_83 : _GEN_210; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_212 = 7'h54 == pht_index ? BTB_84 : _GEN_211; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_213 = 7'h55 == pht_index ? BTB_85 : _GEN_212; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_214 = 7'h56 == pht_index ? BTB_86 : _GEN_213; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_215 = 7'h57 == pht_index ? BTB_87 : _GEN_214; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_216 = 7'h58 == pht_index ? BTB_88 : _GEN_215; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_217 = 7'h59 == pht_index ? BTB_89 : _GEN_216; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_218 = 7'h5a == pht_index ? BTB_90 : _GEN_217; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_219 = 7'h5b == pht_index ? BTB_91 : _GEN_218; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_220 = 7'h5c == pht_index ? BTB_92 : _GEN_219; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_221 = 7'h5d == pht_index ? BTB_93 : _GEN_220; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_222 = 7'h5e == pht_index ? BTB_94 : _GEN_221; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_223 = 7'h5f == pht_index ? BTB_95 : _GEN_222; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_224 = 7'h60 == pht_index ? BTB_96 : _GEN_223; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_225 = 7'h61 == pht_index ? BTB_97 : _GEN_224; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_226 = 7'h62 == pht_index ? BTB_98 : _GEN_225; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_227 = 7'h63 == pht_index ? BTB_99 : _GEN_226; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_228 = 7'h64 == pht_index ? BTB_100 : _GEN_227; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_229 = 7'h65 == pht_index ? BTB_101 : _GEN_228; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_230 = 7'h66 == pht_index ? BTB_102 : _GEN_229; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_231 = 7'h67 == pht_index ? BTB_103 : _GEN_230; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_232 = 7'h68 == pht_index ? BTB_104 : _GEN_231; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_233 = 7'h69 == pht_index ? BTB_105 : _GEN_232; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_234 = 7'h6a == pht_index ? BTB_106 : _GEN_233; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_235 = 7'h6b == pht_index ? BTB_107 : _GEN_234; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_236 = 7'h6c == pht_index ? BTB_108 : _GEN_235; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_237 = 7'h6d == pht_index ? BTB_109 : _GEN_236; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_238 = 7'h6e == pht_index ? BTB_110 : _GEN_237; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_239 = 7'h6f == pht_index ? BTB_111 : _GEN_238; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_240 = 7'h70 == pht_index ? BTB_112 : _GEN_239; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_241 = 7'h71 == pht_index ? BTB_113 : _GEN_240; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_242 = 7'h72 == pht_index ? BTB_114 : _GEN_241; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_243 = 7'h73 == pht_index ? BTB_115 : _GEN_242; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_244 = 7'h74 == pht_index ? BTB_116 : _GEN_243; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_245 = 7'h75 == pht_index ? BTB_117 : _GEN_244; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_246 = 7'h76 == pht_index ? BTB_118 : _GEN_245; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_247 = 7'h77 == pht_index ? BTB_119 : _GEN_246; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_248 = 7'h78 == pht_index ? BTB_120 : _GEN_247; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_249 = 7'h79 == pht_index ? BTB_121 : _GEN_248; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_250 = 7'h7a == pht_index ? BTB_122 : _GEN_249; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_251 = 7'h7b == pht_index ? BTB_123 : _GEN_250; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_252 = 7'h7c == pht_index ? BTB_124 : _GEN_251; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_253 = 7'h7d == pht_index ? BTB_125 : _GEN_252; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_254 = 7'h7e == pht_index ? BTB_126 : _GEN_253; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] _GEN_255 = 7'h7f == pht_index ? BTB_127 : _GEN_254; // @[cmd4.sc 46:25 cmd4.sc 46:25]
  wire [6:0] btb_index = train_pc ^ train_history; // @[cmd4.sc 53:30]
  HistoryShift u_gbh ( // @[cmd4.sc 32:23]
    .clk(u_gbh_clk),
    .areset(u_gbh_areset),
    .train_taken(u_gbh_train_taken),
    .train_mispredicted(u_gbh_train_mispredicted),
    .train_history(u_gbh_train_history),
    .predict_valid(u_gbh_predict_valid),
    .predict_taken(u_gbh_predict_taken),
    .predict_history(u_gbh_predict_history)
  );
  Counter2bc Counter2bc ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_clk),
    .areset(Counter2bc_areset),
    .train_valid(Counter2bc_train_valid),
    .train_taken(Counter2bc_train_taken),
    .state(Counter2bc_state)
  );
  Counter2bc Counter2bc_1 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_1_clk),
    .areset(Counter2bc_1_areset),
    .train_valid(Counter2bc_1_train_valid),
    .train_taken(Counter2bc_1_train_taken),
    .state(Counter2bc_1_state)
  );
  Counter2bc Counter2bc_2 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_2_clk),
    .areset(Counter2bc_2_areset),
    .train_valid(Counter2bc_2_train_valid),
    .train_taken(Counter2bc_2_train_taken),
    .state(Counter2bc_2_state)
  );
  Counter2bc Counter2bc_3 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_3_clk),
    .areset(Counter2bc_3_areset),
    .train_valid(Counter2bc_3_train_valid),
    .train_taken(Counter2bc_3_train_taken),
    .state(Counter2bc_3_state)
  );
  Counter2bc Counter2bc_4 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_4_clk),
    .areset(Counter2bc_4_areset),
    .train_valid(Counter2bc_4_train_valid),
    .train_taken(Counter2bc_4_train_taken),
    .state(Counter2bc_4_state)
  );
  Counter2bc Counter2bc_5 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_5_clk),
    .areset(Counter2bc_5_areset),
    .train_valid(Counter2bc_5_train_valid),
    .train_taken(Counter2bc_5_train_taken),
    .state(Counter2bc_5_state)
  );
  Counter2bc Counter2bc_6 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_6_clk),
    .areset(Counter2bc_6_areset),
    .train_valid(Counter2bc_6_train_valid),
    .train_taken(Counter2bc_6_train_taken),
    .state(Counter2bc_6_state)
  );
  Counter2bc Counter2bc_7 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_7_clk),
    .areset(Counter2bc_7_areset),
    .train_valid(Counter2bc_7_train_valid),
    .train_taken(Counter2bc_7_train_taken),
    .state(Counter2bc_7_state)
  );
  Counter2bc Counter2bc_8 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_8_clk),
    .areset(Counter2bc_8_areset),
    .train_valid(Counter2bc_8_train_valid),
    .train_taken(Counter2bc_8_train_taken),
    .state(Counter2bc_8_state)
  );
  Counter2bc Counter2bc_9 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_9_clk),
    .areset(Counter2bc_9_areset),
    .train_valid(Counter2bc_9_train_valid),
    .train_taken(Counter2bc_9_train_taken),
    .state(Counter2bc_9_state)
  );
  Counter2bc Counter2bc_10 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_10_clk),
    .areset(Counter2bc_10_areset),
    .train_valid(Counter2bc_10_train_valid),
    .train_taken(Counter2bc_10_train_taken),
    .state(Counter2bc_10_state)
  );
  Counter2bc Counter2bc_11 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_11_clk),
    .areset(Counter2bc_11_areset),
    .train_valid(Counter2bc_11_train_valid),
    .train_taken(Counter2bc_11_train_taken),
    .state(Counter2bc_11_state)
  );
  Counter2bc Counter2bc_12 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_12_clk),
    .areset(Counter2bc_12_areset),
    .train_valid(Counter2bc_12_train_valid),
    .train_taken(Counter2bc_12_train_taken),
    .state(Counter2bc_12_state)
  );
  Counter2bc Counter2bc_13 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_13_clk),
    .areset(Counter2bc_13_areset),
    .train_valid(Counter2bc_13_train_valid),
    .train_taken(Counter2bc_13_train_taken),
    .state(Counter2bc_13_state)
  );
  Counter2bc Counter2bc_14 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_14_clk),
    .areset(Counter2bc_14_areset),
    .train_valid(Counter2bc_14_train_valid),
    .train_taken(Counter2bc_14_train_taken),
    .state(Counter2bc_14_state)
  );
  Counter2bc Counter2bc_15 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_15_clk),
    .areset(Counter2bc_15_areset),
    .train_valid(Counter2bc_15_train_valid),
    .train_taken(Counter2bc_15_train_taken),
    .state(Counter2bc_15_state)
  );
  Counter2bc Counter2bc_16 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_16_clk),
    .areset(Counter2bc_16_areset),
    .train_valid(Counter2bc_16_train_valid),
    .train_taken(Counter2bc_16_train_taken),
    .state(Counter2bc_16_state)
  );
  Counter2bc Counter2bc_17 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_17_clk),
    .areset(Counter2bc_17_areset),
    .train_valid(Counter2bc_17_train_valid),
    .train_taken(Counter2bc_17_train_taken),
    .state(Counter2bc_17_state)
  );
  Counter2bc Counter2bc_18 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_18_clk),
    .areset(Counter2bc_18_areset),
    .train_valid(Counter2bc_18_train_valid),
    .train_taken(Counter2bc_18_train_taken),
    .state(Counter2bc_18_state)
  );
  Counter2bc Counter2bc_19 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_19_clk),
    .areset(Counter2bc_19_areset),
    .train_valid(Counter2bc_19_train_valid),
    .train_taken(Counter2bc_19_train_taken),
    .state(Counter2bc_19_state)
  );
  Counter2bc Counter2bc_20 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_20_clk),
    .areset(Counter2bc_20_areset),
    .train_valid(Counter2bc_20_train_valid),
    .train_taken(Counter2bc_20_train_taken),
    .state(Counter2bc_20_state)
  );
  Counter2bc Counter2bc_21 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_21_clk),
    .areset(Counter2bc_21_areset),
    .train_valid(Counter2bc_21_train_valid),
    .train_taken(Counter2bc_21_train_taken),
    .state(Counter2bc_21_state)
  );
  Counter2bc Counter2bc_22 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_22_clk),
    .areset(Counter2bc_22_areset),
    .train_valid(Counter2bc_22_train_valid),
    .train_taken(Counter2bc_22_train_taken),
    .state(Counter2bc_22_state)
  );
  Counter2bc Counter2bc_23 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_23_clk),
    .areset(Counter2bc_23_areset),
    .train_valid(Counter2bc_23_train_valid),
    .train_taken(Counter2bc_23_train_taken),
    .state(Counter2bc_23_state)
  );
  Counter2bc Counter2bc_24 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_24_clk),
    .areset(Counter2bc_24_areset),
    .train_valid(Counter2bc_24_train_valid),
    .train_taken(Counter2bc_24_train_taken),
    .state(Counter2bc_24_state)
  );
  Counter2bc Counter2bc_25 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_25_clk),
    .areset(Counter2bc_25_areset),
    .train_valid(Counter2bc_25_train_valid),
    .train_taken(Counter2bc_25_train_taken),
    .state(Counter2bc_25_state)
  );
  Counter2bc Counter2bc_26 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_26_clk),
    .areset(Counter2bc_26_areset),
    .train_valid(Counter2bc_26_train_valid),
    .train_taken(Counter2bc_26_train_taken),
    .state(Counter2bc_26_state)
  );
  Counter2bc Counter2bc_27 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_27_clk),
    .areset(Counter2bc_27_areset),
    .train_valid(Counter2bc_27_train_valid),
    .train_taken(Counter2bc_27_train_taken),
    .state(Counter2bc_27_state)
  );
  Counter2bc Counter2bc_28 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_28_clk),
    .areset(Counter2bc_28_areset),
    .train_valid(Counter2bc_28_train_valid),
    .train_taken(Counter2bc_28_train_taken),
    .state(Counter2bc_28_state)
  );
  Counter2bc Counter2bc_29 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_29_clk),
    .areset(Counter2bc_29_areset),
    .train_valid(Counter2bc_29_train_valid),
    .train_taken(Counter2bc_29_train_taken),
    .state(Counter2bc_29_state)
  );
  Counter2bc Counter2bc_30 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_30_clk),
    .areset(Counter2bc_30_areset),
    .train_valid(Counter2bc_30_train_valid),
    .train_taken(Counter2bc_30_train_taken),
    .state(Counter2bc_30_state)
  );
  Counter2bc Counter2bc_31 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_31_clk),
    .areset(Counter2bc_31_areset),
    .train_valid(Counter2bc_31_train_valid),
    .train_taken(Counter2bc_31_train_taken),
    .state(Counter2bc_31_state)
  );
  Counter2bc Counter2bc_32 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_32_clk),
    .areset(Counter2bc_32_areset),
    .train_valid(Counter2bc_32_train_valid),
    .train_taken(Counter2bc_32_train_taken),
    .state(Counter2bc_32_state)
  );
  Counter2bc Counter2bc_33 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_33_clk),
    .areset(Counter2bc_33_areset),
    .train_valid(Counter2bc_33_train_valid),
    .train_taken(Counter2bc_33_train_taken),
    .state(Counter2bc_33_state)
  );
  Counter2bc Counter2bc_34 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_34_clk),
    .areset(Counter2bc_34_areset),
    .train_valid(Counter2bc_34_train_valid),
    .train_taken(Counter2bc_34_train_taken),
    .state(Counter2bc_34_state)
  );
  Counter2bc Counter2bc_35 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_35_clk),
    .areset(Counter2bc_35_areset),
    .train_valid(Counter2bc_35_train_valid),
    .train_taken(Counter2bc_35_train_taken),
    .state(Counter2bc_35_state)
  );
  Counter2bc Counter2bc_36 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_36_clk),
    .areset(Counter2bc_36_areset),
    .train_valid(Counter2bc_36_train_valid),
    .train_taken(Counter2bc_36_train_taken),
    .state(Counter2bc_36_state)
  );
  Counter2bc Counter2bc_37 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_37_clk),
    .areset(Counter2bc_37_areset),
    .train_valid(Counter2bc_37_train_valid),
    .train_taken(Counter2bc_37_train_taken),
    .state(Counter2bc_37_state)
  );
  Counter2bc Counter2bc_38 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_38_clk),
    .areset(Counter2bc_38_areset),
    .train_valid(Counter2bc_38_train_valid),
    .train_taken(Counter2bc_38_train_taken),
    .state(Counter2bc_38_state)
  );
  Counter2bc Counter2bc_39 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_39_clk),
    .areset(Counter2bc_39_areset),
    .train_valid(Counter2bc_39_train_valid),
    .train_taken(Counter2bc_39_train_taken),
    .state(Counter2bc_39_state)
  );
  Counter2bc Counter2bc_40 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_40_clk),
    .areset(Counter2bc_40_areset),
    .train_valid(Counter2bc_40_train_valid),
    .train_taken(Counter2bc_40_train_taken),
    .state(Counter2bc_40_state)
  );
  Counter2bc Counter2bc_41 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_41_clk),
    .areset(Counter2bc_41_areset),
    .train_valid(Counter2bc_41_train_valid),
    .train_taken(Counter2bc_41_train_taken),
    .state(Counter2bc_41_state)
  );
  Counter2bc Counter2bc_42 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_42_clk),
    .areset(Counter2bc_42_areset),
    .train_valid(Counter2bc_42_train_valid),
    .train_taken(Counter2bc_42_train_taken),
    .state(Counter2bc_42_state)
  );
  Counter2bc Counter2bc_43 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_43_clk),
    .areset(Counter2bc_43_areset),
    .train_valid(Counter2bc_43_train_valid),
    .train_taken(Counter2bc_43_train_taken),
    .state(Counter2bc_43_state)
  );
  Counter2bc Counter2bc_44 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_44_clk),
    .areset(Counter2bc_44_areset),
    .train_valid(Counter2bc_44_train_valid),
    .train_taken(Counter2bc_44_train_taken),
    .state(Counter2bc_44_state)
  );
  Counter2bc Counter2bc_45 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_45_clk),
    .areset(Counter2bc_45_areset),
    .train_valid(Counter2bc_45_train_valid),
    .train_taken(Counter2bc_45_train_taken),
    .state(Counter2bc_45_state)
  );
  Counter2bc Counter2bc_46 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_46_clk),
    .areset(Counter2bc_46_areset),
    .train_valid(Counter2bc_46_train_valid),
    .train_taken(Counter2bc_46_train_taken),
    .state(Counter2bc_46_state)
  );
  Counter2bc Counter2bc_47 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_47_clk),
    .areset(Counter2bc_47_areset),
    .train_valid(Counter2bc_47_train_valid),
    .train_taken(Counter2bc_47_train_taken),
    .state(Counter2bc_47_state)
  );
  Counter2bc Counter2bc_48 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_48_clk),
    .areset(Counter2bc_48_areset),
    .train_valid(Counter2bc_48_train_valid),
    .train_taken(Counter2bc_48_train_taken),
    .state(Counter2bc_48_state)
  );
  Counter2bc Counter2bc_49 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_49_clk),
    .areset(Counter2bc_49_areset),
    .train_valid(Counter2bc_49_train_valid),
    .train_taken(Counter2bc_49_train_taken),
    .state(Counter2bc_49_state)
  );
  Counter2bc Counter2bc_50 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_50_clk),
    .areset(Counter2bc_50_areset),
    .train_valid(Counter2bc_50_train_valid),
    .train_taken(Counter2bc_50_train_taken),
    .state(Counter2bc_50_state)
  );
  Counter2bc Counter2bc_51 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_51_clk),
    .areset(Counter2bc_51_areset),
    .train_valid(Counter2bc_51_train_valid),
    .train_taken(Counter2bc_51_train_taken),
    .state(Counter2bc_51_state)
  );
  Counter2bc Counter2bc_52 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_52_clk),
    .areset(Counter2bc_52_areset),
    .train_valid(Counter2bc_52_train_valid),
    .train_taken(Counter2bc_52_train_taken),
    .state(Counter2bc_52_state)
  );
  Counter2bc Counter2bc_53 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_53_clk),
    .areset(Counter2bc_53_areset),
    .train_valid(Counter2bc_53_train_valid),
    .train_taken(Counter2bc_53_train_taken),
    .state(Counter2bc_53_state)
  );
  Counter2bc Counter2bc_54 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_54_clk),
    .areset(Counter2bc_54_areset),
    .train_valid(Counter2bc_54_train_valid),
    .train_taken(Counter2bc_54_train_taken),
    .state(Counter2bc_54_state)
  );
  Counter2bc Counter2bc_55 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_55_clk),
    .areset(Counter2bc_55_areset),
    .train_valid(Counter2bc_55_train_valid),
    .train_taken(Counter2bc_55_train_taken),
    .state(Counter2bc_55_state)
  );
  Counter2bc Counter2bc_56 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_56_clk),
    .areset(Counter2bc_56_areset),
    .train_valid(Counter2bc_56_train_valid),
    .train_taken(Counter2bc_56_train_taken),
    .state(Counter2bc_56_state)
  );
  Counter2bc Counter2bc_57 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_57_clk),
    .areset(Counter2bc_57_areset),
    .train_valid(Counter2bc_57_train_valid),
    .train_taken(Counter2bc_57_train_taken),
    .state(Counter2bc_57_state)
  );
  Counter2bc Counter2bc_58 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_58_clk),
    .areset(Counter2bc_58_areset),
    .train_valid(Counter2bc_58_train_valid),
    .train_taken(Counter2bc_58_train_taken),
    .state(Counter2bc_58_state)
  );
  Counter2bc Counter2bc_59 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_59_clk),
    .areset(Counter2bc_59_areset),
    .train_valid(Counter2bc_59_train_valid),
    .train_taken(Counter2bc_59_train_taken),
    .state(Counter2bc_59_state)
  );
  Counter2bc Counter2bc_60 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_60_clk),
    .areset(Counter2bc_60_areset),
    .train_valid(Counter2bc_60_train_valid),
    .train_taken(Counter2bc_60_train_taken),
    .state(Counter2bc_60_state)
  );
  Counter2bc Counter2bc_61 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_61_clk),
    .areset(Counter2bc_61_areset),
    .train_valid(Counter2bc_61_train_valid),
    .train_taken(Counter2bc_61_train_taken),
    .state(Counter2bc_61_state)
  );
  Counter2bc Counter2bc_62 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_62_clk),
    .areset(Counter2bc_62_areset),
    .train_valid(Counter2bc_62_train_valid),
    .train_taken(Counter2bc_62_train_taken),
    .state(Counter2bc_62_state)
  );
  Counter2bc Counter2bc_63 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_63_clk),
    .areset(Counter2bc_63_areset),
    .train_valid(Counter2bc_63_train_valid),
    .train_taken(Counter2bc_63_train_taken),
    .state(Counter2bc_63_state)
  );
  Counter2bc Counter2bc_64 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_64_clk),
    .areset(Counter2bc_64_areset),
    .train_valid(Counter2bc_64_train_valid),
    .train_taken(Counter2bc_64_train_taken),
    .state(Counter2bc_64_state)
  );
  Counter2bc Counter2bc_65 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_65_clk),
    .areset(Counter2bc_65_areset),
    .train_valid(Counter2bc_65_train_valid),
    .train_taken(Counter2bc_65_train_taken),
    .state(Counter2bc_65_state)
  );
  Counter2bc Counter2bc_66 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_66_clk),
    .areset(Counter2bc_66_areset),
    .train_valid(Counter2bc_66_train_valid),
    .train_taken(Counter2bc_66_train_taken),
    .state(Counter2bc_66_state)
  );
  Counter2bc Counter2bc_67 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_67_clk),
    .areset(Counter2bc_67_areset),
    .train_valid(Counter2bc_67_train_valid),
    .train_taken(Counter2bc_67_train_taken),
    .state(Counter2bc_67_state)
  );
  Counter2bc Counter2bc_68 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_68_clk),
    .areset(Counter2bc_68_areset),
    .train_valid(Counter2bc_68_train_valid),
    .train_taken(Counter2bc_68_train_taken),
    .state(Counter2bc_68_state)
  );
  Counter2bc Counter2bc_69 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_69_clk),
    .areset(Counter2bc_69_areset),
    .train_valid(Counter2bc_69_train_valid),
    .train_taken(Counter2bc_69_train_taken),
    .state(Counter2bc_69_state)
  );
  Counter2bc Counter2bc_70 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_70_clk),
    .areset(Counter2bc_70_areset),
    .train_valid(Counter2bc_70_train_valid),
    .train_taken(Counter2bc_70_train_taken),
    .state(Counter2bc_70_state)
  );
  Counter2bc Counter2bc_71 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_71_clk),
    .areset(Counter2bc_71_areset),
    .train_valid(Counter2bc_71_train_valid),
    .train_taken(Counter2bc_71_train_taken),
    .state(Counter2bc_71_state)
  );
  Counter2bc Counter2bc_72 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_72_clk),
    .areset(Counter2bc_72_areset),
    .train_valid(Counter2bc_72_train_valid),
    .train_taken(Counter2bc_72_train_taken),
    .state(Counter2bc_72_state)
  );
  Counter2bc Counter2bc_73 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_73_clk),
    .areset(Counter2bc_73_areset),
    .train_valid(Counter2bc_73_train_valid),
    .train_taken(Counter2bc_73_train_taken),
    .state(Counter2bc_73_state)
  );
  Counter2bc Counter2bc_74 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_74_clk),
    .areset(Counter2bc_74_areset),
    .train_valid(Counter2bc_74_train_valid),
    .train_taken(Counter2bc_74_train_taken),
    .state(Counter2bc_74_state)
  );
  Counter2bc Counter2bc_75 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_75_clk),
    .areset(Counter2bc_75_areset),
    .train_valid(Counter2bc_75_train_valid),
    .train_taken(Counter2bc_75_train_taken),
    .state(Counter2bc_75_state)
  );
  Counter2bc Counter2bc_76 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_76_clk),
    .areset(Counter2bc_76_areset),
    .train_valid(Counter2bc_76_train_valid),
    .train_taken(Counter2bc_76_train_taken),
    .state(Counter2bc_76_state)
  );
  Counter2bc Counter2bc_77 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_77_clk),
    .areset(Counter2bc_77_areset),
    .train_valid(Counter2bc_77_train_valid),
    .train_taken(Counter2bc_77_train_taken),
    .state(Counter2bc_77_state)
  );
  Counter2bc Counter2bc_78 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_78_clk),
    .areset(Counter2bc_78_areset),
    .train_valid(Counter2bc_78_train_valid),
    .train_taken(Counter2bc_78_train_taken),
    .state(Counter2bc_78_state)
  );
  Counter2bc Counter2bc_79 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_79_clk),
    .areset(Counter2bc_79_areset),
    .train_valid(Counter2bc_79_train_valid),
    .train_taken(Counter2bc_79_train_taken),
    .state(Counter2bc_79_state)
  );
  Counter2bc Counter2bc_80 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_80_clk),
    .areset(Counter2bc_80_areset),
    .train_valid(Counter2bc_80_train_valid),
    .train_taken(Counter2bc_80_train_taken),
    .state(Counter2bc_80_state)
  );
  Counter2bc Counter2bc_81 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_81_clk),
    .areset(Counter2bc_81_areset),
    .train_valid(Counter2bc_81_train_valid),
    .train_taken(Counter2bc_81_train_taken),
    .state(Counter2bc_81_state)
  );
  Counter2bc Counter2bc_82 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_82_clk),
    .areset(Counter2bc_82_areset),
    .train_valid(Counter2bc_82_train_valid),
    .train_taken(Counter2bc_82_train_taken),
    .state(Counter2bc_82_state)
  );
  Counter2bc Counter2bc_83 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_83_clk),
    .areset(Counter2bc_83_areset),
    .train_valid(Counter2bc_83_train_valid),
    .train_taken(Counter2bc_83_train_taken),
    .state(Counter2bc_83_state)
  );
  Counter2bc Counter2bc_84 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_84_clk),
    .areset(Counter2bc_84_areset),
    .train_valid(Counter2bc_84_train_valid),
    .train_taken(Counter2bc_84_train_taken),
    .state(Counter2bc_84_state)
  );
  Counter2bc Counter2bc_85 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_85_clk),
    .areset(Counter2bc_85_areset),
    .train_valid(Counter2bc_85_train_valid),
    .train_taken(Counter2bc_85_train_taken),
    .state(Counter2bc_85_state)
  );
  Counter2bc Counter2bc_86 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_86_clk),
    .areset(Counter2bc_86_areset),
    .train_valid(Counter2bc_86_train_valid),
    .train_taken(Counter2bc_86_train_taken),
    .state(Counter2bc_86_state)
  );
  Counter2bc Counter2bc_87 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_87_clk),
    .areset(Counter2bc_87_areset),
    .train_valid(Counter2bc_87_train_valid),
    .train_taken(Counter2bc_87_train_taken),
    .state(Counter2bc_87_state)
  );
  Counter2bc Counter2bc_88 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_88_clk),
    .areset(Counter2bc_88_areset),
    .train_valid(Counter2bc_88_train_valid),
    .train_taken(Counter2bc_88_train_taken),
    .state(Counter2bc_88_state)
  );
  Counter2bc Counter2bc_89 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_89_clk),
    .areset(Counter2bc_89_areset),
    .train_valid(Counter2bc_89_train_valid),
    .train_taken(Counter2bc_89_train_taken),
    .state(Counter2bc_89_state)
  );
  Counter2bc Counter2bc_90 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_90_clk),
    .areset(Counter2bc_90_areset),
    .train_valid(Counter2bc_90_train_valid),
    .train_taken(Counter2bc_90_train_taken),
    .state(Counter2bc_90_state)
  );
  Counter2bc Counter2bc_91 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_91_clk),
    .areset(Counter2bc_91_areset),
    .train_valid(Counter2bc_91_train_valid),
    .train_taken(Counter2bc_91_train_taken),
    .state(Counter2bc_91_state)
  );
  Counter2bc Counter2bc_92 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_92_clk),
    .areset(Counter2bc_92_areset),
    .train_valid(Counter2bc_92_train_valid),
    .train_taken(Counter2bc_92_train_taken),
    .state(Counter2bc_92_state)
  );
  Counter2bc Counter2bc_93 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_93_clk),
    .areset(Counter2bc_93_areset),
    .train_valid(Counter2bc_93_train_valid),
    .train_taken(Counter2bc_93_train_taken),
    .state(Counter2bc_93_state)
  );
  Counter2bc Counter2bc_94 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_94_clk),
    .areset(Counter2bc_94_areset),
    .train_valid(Counter2bc_94_train_valid),
    .train_taken(Counter2bc_94_train_taken),
    .state(Counter2bc_94_state)
  );
  Counter2bc Counter2bc_95 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_95_clk),
    .areset(Counter2bc_95_areset),
    .train_valid(Counter2bc_95_train_valid),
    .train_taken(Counter2bc_95_train_taken),
    .state(Counter2bc_95_state)
  );
  Counter2bc Counter2bc_96 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_96_clk),
    .areset(Counter2bc_96_areset),
    .train_valid(Counter2bc_96_train_valid),
    .train_taken(Counter2bc_96_train_taken),
    .state(Counter2bc_96_state)
  );
  Counter2bc Counter2bc_97 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_97_clk),
    .areset(Counter2bc_97_areset),
    .train_valid(Counter2bc_97_train_valid),
    .train_taken(Counter2bc_97_train_taken),
    .state(Counter2bc_97_state)
  );
  Counter2bc Counter2bc_98 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_98_clk),
    .areset(Counter2bc_98_areset),
    .train_valid(Counter2bc_98_train_valid),
    .train_taken(Counter2bc_98_train_taken),
    .state(Counter2bc_98_state)
  );
  Counter2bc Counter2bc_99 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_99_clk),
    .areset(Counter2bc_99_areset),
    .train_valid(Counter2bc_99_train_valid),
    .train_taken(Counter2bc_99_train_taken),
    .state(Counter2bc_99_state)
  );
  Counter2bc Counter2bc_100 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_100_clk),
    .areset(Counter2bc_100_areset),
    .train_valid(Counter2bc_100_train_valid),
    .train_taken(Counter2bc_100_train_taken),
    .state(Counter2bc_100_state)
  );
  Counter2bc Counter2bc_101 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_101_clk),
    .areset(Counter2bc_101_areset),
    .train_valid(Counter2bc_101_train_valid),
    .train_taken(Counter2bc_101_train_taken),
    .state(Counter2bc_101_state)
  );
  Counter2bc Counter2bc_102 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_102_clk),
    .areset(Counter2bc_102_areset),
    .train_valid(Counter2bc_102_train_valid),
    .train_taken(Counter2bc_102_train_taken),
    .state(Counter2bc_102_state)
  );
  Counter2bc Counter2bc_103 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_103_clk),
    .areset(Counter2bc_103_areset),
    .train_valid(Counter2bc_103_train_valid),
    .train_taken(Counter2bc_103_train_taken),
    .state(Counter2bc_103_state)
  );
  Counter2bc Counter2bc_104 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_104_clk),
    .areset(Counter2bc_104_areset),
    .train_valid(Counter2bc_104_train_valid),
    .train_taken(Counter2bc_104_train_taken),
    .state(Counter2bc_104_state)
  );
  Counter2bc Counter2bc_105 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_105_clk),
    .areset(Counter2bc_105_areset),
    .train_valid(Counter2bc_105_train_valid),
    .train_taken(Counter2bc_105_train_taken),
    .state(Counter2bc_105_state)
  );
  Counter2bc Counter2bc_106 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_106_clk),
    .areset(Counter2bc_106_areset),
    .train_valid(Counter2bc_106_train_valid),
    .train_taken(Counter2bc_106_train_taken),
    .state(Counter2bc_106_state)
  );
  Counter2bc Counter2bc_107 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_107_clk),
    .areset(Counter2bc_107_areset),
    .train_valid(Counter2bc_107_train_valid),
    .train_taken(Counter2bc_107_train_taken),
    .state(Counter2bc_107_state)
  );
  Counter2bc Counter2bc_108 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_108_clk),
    .areset(Counter2bc_108_areset),
    .train_valid(Counter2bc_108_train_valid),
    .train_taken(Counter2bc_108_train_taken),
    .state(Counter2bc_108_state)
  );
  Counter2bc Counter2bc_109 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_109_clk),
    .areset(Counter2bc_109_areset),
    .train_valid(Counter2bc_109_train_valid),
    .train_taken(Counter2bc_109_train_taken),
    .state(Counter2bc_109_state)
  );
  Counter2bc Counter2bc_110 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_110_clk),
    .areset(Counter2bc_110_areset),
    .train_valid(Counter2bc_110_train_valid),
    .train_taken(Counter2bc_110_train_taken),
    .state(Counter2bc_110_state)
  );
  Counter2bc Counter2bc_111 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_111_clk),
    .areset(Counter2bc_111_areset),
    .train_valid(Counter2bc_111_train_valid),
    .train_taken(Counter2bc_111_train_taken),
    .state(Counter2bc_111_state)
  );
  Counter2bc Counter2bc_112 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_112_clk),
    .areset(Counter2bc_112_areset),
    .train_valid(Counter2bc_112_train_valid),
    .train_taken(Counter2bc_112_train_taken),
    .state(Counter2bc_112_state)
  );
  Counter2bc Counter2bc_113 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_113_clk),
    .areset(Counter2bc_113_areset),
    .train_valid(Counter2bc_113_train_valid),
    .train_taken(Counter2bc_113_train_taken),
    .state(Counter2bc_113_state)
  );
  Counter2bc Counter2bc_114 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_114_clk),
    .areset(Counter2bc_114_areset),
    .train_valid(Counter2bc_114_train_valid),
    .train_taken(Counter2bc_114_train_taken),
    .state(Counter2bc_114_state)
  );
  Counter2bc Counter2bc_115 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_115_clk),
    .areset(Counter2bc_115_areset),
    .train_valid(Counter2bc_115_train_valid),
    .train_taken(Counter2bc_115_train_taken),
    .state(Counter2bc_115_state)
  );
  Counter2bc Counter2bc_116 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_116_clk),
    .areset(Counter2bc_116_areset),
    .train_valid(Counter2bc_116_train_valid),
    .train_taken(Counter2bc_116_train_taken),
    .state(Counter2bc_116_state)
  );
  Counter2bc Counter2bc_117 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_117_clk),
    .areset(Counter2bc_117_areset),
    .train_valid(Counter2bc_117_train_valid),
    .train_taken(Counter2bc_117_train_taken),
    .state(Counter2bc_117_state)
  );
  Counter2bc Counter2bc_118 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_118_clk),
    .areset(Counter2bc_118_areset),
    .train_valid(Counter2bc_118_train_valid),
    .train_taken(Counter2bc_118_train_taken),
    .state(Counter2bc_118_state)
  );
  Counter2bc Counter2bc_119 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_119_clk),
    .areset(Counter2bc_119_areset),
    .train_valid(Counter2bc_119_train_valid),
    .train_taken(Counter2bc_119_train_taken),
    .state(Counter2bc_119_state)
  );
  Counter2bc Counter2bc_120 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_120_clk),
    .areset(Counter2bc_120_areset),
    .train_valid(Counter2bc_120_train_valid),
    .train_taken(Counter2bc_120_train_taken),
    .state(Counter2bc_120_state)
  );
  Counter2bc Counter2bc_121 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_121_clk),
    .areset(Counter2bc_121_areset),
    .train_valid(Counter2bc_121_train_valid),
    .train_taken(Counter2bc_121_train_taken),
    .state(Counter2bc_121_state)
  );
  Counter2bc Counter2bc_122 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_122_clk),
    .areset(Counter2bc_122_areset),
    .train_valid(Counter2bc_122_train_valid),
    .train_taken(Counter2bc_122_train_taken),
    .state(Counter2bc_122_state)
  );
  Counter2bc Counter2bc_123 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_123_clk),
    .areset(Counter2bc_123_areset),
    .train_valid(Counter2bc_123_train_valid),
    .train_taken(Counter2bc_123_train_taken),
    .state(Counter2bc_123_state)
  );
  Counter2bc Counter2bc_124 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_124_clk),
    .areset(Counter2bc_124_areset),
    .train_valid(Counter2bc_124_train_valid),
    .train_taken(Counter2bc_124_train_taken),
    .state(Counter2bc_124_state)
  );
  Counter2bc Counter2bc_125 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_125_clk),
    .areset(Counter2bc_125_areset),
    .train_valid(Counter2bc_125_train_valid),
    .train_taken(Counter2bc_125_train_taken),
    .state(Counter2bc_125_state)
  );
  Counter2bc Counter2bc_126 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_126_clk),
    .areset(Counter2bc_126_areset),
    .train_valid(Counter2bc_126_train_valid),
    .train_taken(Counter2bc_126_train_taken),
    .state(Counter2bc_126_state)
  );
  Counter2bc Counter2bc_127 ( // @[cmd4.sc 55:27]
    .clk(Counter2bc_127_clk),
    .areset(Counter2bc_127_areset),
    .train_valid(Counter2bc_127_train_valid),
    .train_taken(Counter2bc_127_train_taken),
    .state(Counter2bc_127_state)
  );
  assign predict_history = predict_valid ? _GEN_255 : predict_pc; // @[cmd4.sc 44:31 cmd4.sc 46:25 cmd4.sc 49:25]
  assign predict_taken = predict_valid & _GEN_127[1]; // @[cmd4.sc 44:31 cmd4.sc 45:23 cmd4.sc 48:23]
  assign u_gbh_clk = clk; // @[cmd4.sc 35:15]
  assign u_gbh_areset = areset; // @[cmd4.sc 36:18]
  assign u_gbh_train_taken = train_taken; // @[cmd4.sc 37:23]
  assign u_gbh_train_mispredicted = train_mispredicted; // @[cmd4.sc 38:30]
  assign u_gbh_train_history = train_history; // @[cmd4.sc 39:25]
  assign u_gbh_predict_valid = predict_valid; // @[cmd4.sc 40:25]
  assign u_gbh_predict_taken = predict_taken; // @[cmd4.sc 41:25]
  assign Counter2bc_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_1_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_1_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_1_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_1_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_2_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_2_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_2_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_2_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_3_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_3_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_3_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_3_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_4_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_4_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_4_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_4_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_5_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_5_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_5_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_5_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_6_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_6_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_6_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_6_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_7_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_7_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_7_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_7_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_8_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_8_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_8_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_8_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_9_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_9_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_9_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_9_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_10_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_10_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_10_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_10_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_11_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_11_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_11_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_11_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_12_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_12_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_12_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_12_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_13_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_13_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_13_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_13_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_14_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_14_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_14_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_14_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_15_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_15_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_15_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_15_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_16_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_16_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_16_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_16_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_17_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_17_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_17_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_17_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_18_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_18_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_18_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_18_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_19_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_19_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_19_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_19_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_20_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_20_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_20_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_20_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_21_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_21_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_21_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_21_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_22_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_22_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_22_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_22_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_23_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_23_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_23_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_23_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_24_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_24_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_24_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_24_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_25_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_25_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_25_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_25_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_26_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_26_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_26_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_26_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_27_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_27_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_27_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_27_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_28_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_28_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_28_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_28_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_29_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_29_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_29_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_29_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_30_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_30_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_30_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_30_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_31_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_31_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_31_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_31_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_32_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_32_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_32_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_32_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_33_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_33_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_33_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_33_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_34_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_34_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_34_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_34_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_35_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_35_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_35_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_35_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_36_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_36_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_36_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_36_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_37_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_37_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_37_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_37_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_38_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_38_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_38_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_38_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_39_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_39_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_39_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_39_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_40_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_40_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_40_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_40_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_41_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_41_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_41_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_41_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_42_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_42_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_42_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_42_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_43_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_43_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_43_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_43_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_44_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_44_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_44_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_44_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_45_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_45_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_45_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_45_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_46_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_46_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_46_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_46_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_47_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_47_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_47_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_47_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_48_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_48_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_48_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_48_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_49_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_49_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_49_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_49_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_50_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_50_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_50_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_50_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_51_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_51_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_51_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_51_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_52_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_52_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_52_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_52_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_53_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_53_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_53_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_53_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_54_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_54_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_54_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_54_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_55_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_55_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_55_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_55_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_56_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_56_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_56_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_56_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_57_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_57_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_57_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_57_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_58_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_58_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_58_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_58_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_59_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_59_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_59_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_59_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_60_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_60_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_60_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_60_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_61_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_61_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_61_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_61_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_62_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_62_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_62_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_62_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_63_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_63_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_63_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_63_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_64_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_64_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_64_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_64_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_65_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_65_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_65_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_65_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_66_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_66_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_66_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_66_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_67_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_67_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_67_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_67_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_68_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_68_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_68_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_68_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_69_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_69_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_69_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_69_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_70_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_70_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_70_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_70_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_71_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_71_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_71_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_71_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_72_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_72_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_72_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_72_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_73_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_73_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_73_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_73_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_74_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_74_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_74_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_74_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_75_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_75_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_75_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_75_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_76_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_76_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_76_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_76_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_77_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_77_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_77_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_77_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_78_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_78_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_78_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_78_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_79_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_79_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_79_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_79_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_80_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_80_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_80_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_80_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_81_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_81_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_81_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_81_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_82_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_82_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_82_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_82_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_83_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_83_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_83_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_83_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_84_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_84_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_84_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_84_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_85_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_85_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_85_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_85_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_86_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_86_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_86_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_86_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_87_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_87_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_87_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_87_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_88_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_88_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_88_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_88_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_89_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_89_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_89_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_89_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_90_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_90_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_90_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_90_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_91_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_91_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_91_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_91_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_92_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_92_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_92_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_92_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_93_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_93_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_93_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_93_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_94_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_94_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_94_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_94_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_95_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_95_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_95_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_95_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_96_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_96_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_96_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_96_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_97_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_97_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_97_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_97_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_98_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_98_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_98_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_98_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_99_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_99_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_99_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_99_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_100_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_100_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_100_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_100_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_101_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_101_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_101_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_101_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_102_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_102_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_102_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_102_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_103_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_103_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_103_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_103_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_104_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_104_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_104_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_104_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_105_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_105_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_105_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_105_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_106_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_106_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_106_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_106_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_107_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_107_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_107_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_107_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_108_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_108_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_108_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_108_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_109_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_109_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_109_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_109_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_110_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_110_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_110_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_110_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_111_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_111_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_111_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_111_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_112_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_112_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_112_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_112_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_113_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_113_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_113_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_113_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_114_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_114_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_114_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_114_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_115_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_115_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_115_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_115_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_116_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_116_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_116_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_116_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_117_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_117_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_117_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_117_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_118_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_118_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_118_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_118_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_119_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_119_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_119_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_119_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_120_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_120_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_120_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_120_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_121_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_121_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_121_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_121_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_122_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_122_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_122_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_122_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_123_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_123_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_123_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_123_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_124_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_124_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_124_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_124_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_125_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_125_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_125_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_125_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_126_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_126_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_126_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_126_train_taken = train_taken; // @[cmd4.sc 59:27]
  assign Counter2bc_127_clk = clk; // @[cmd4.sc 56:19]
  assign Counter2bc_127_areset = areset; // @[cmd4.sc 57:22]
  assign Counter2bc_127_train_valid = train_valid; // @[cmd4.sc 58:27]
  assign Counter2bc_127_train_taken = train_taken; // @[cmd4.sc 59:27]
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_0 <= 2'h1;
    end else if (btb_index == 7'h0) begin
      if (train_mispredicted & train_valid) begin
        PHT_0 <= Counter2bc_state;
      end else if (predict_valid) begin
        PHT_0 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_1 <= 2'h1;
    end else if (btb_index == 7'h1) begin
      if (train_mispredicted & train_valid) begin
        PHT_1 <= Counter2bc_1_state;
      end else if (predict_valid) begin
        PHT_1 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_2 <= 2'h1;
    end else if (btb_index == 7'h2) begin
      if (train_mispredicted & train_valid) begin
        PHT_2 <= Counter2bc_2_state;
      end else if (predict_valid) begin
        PHT_2 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_3 <= 2'h1;
    end else if (btb_index == 7'h3) begin
      if (train_mispredicted & train_valid) begin
        PHT_3 <= Counter2bc_3_state;
      end else if (predict_valid) begin
        PHT_3 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_4 <= 2'h1;
    end else if (btb_index == 7'h4) begin
      if (train_mispredicted & train_valid) begin
        PHT_4 <= Counter2bc_4_state;
      end else if (predict_valid) begin
        PHT_4 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_5 <= 2'h1;
    end else if (btb_index == 7'h5) begin
      if (train_mispredicted & train_valid) begin
        PHT_5 <= Counter2bc_5_state;
      end else if (predict_valid) begin
        PHT_5 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_6 <= 2'h1;
    end else if (btb_index == 7'h6) begin
      if (train_mispredicted & train_valid) begin
        PHT_6 <= Counter2bc_6_state;
      end else if (predict_valid) begin
        PHT_6 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_7 <= 2'h1;
    end else if (btb_index == 7'h7) begin
      if (train_mispredicted & train_valid) begin
        PHT_7 <= Counter2bc_7_state;
      end else if (predict_valid) begin
        PHT_7 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_8 <= 2'h1;
    end else if (btb_index == 7'h8) begin
      if (train_mispredicted & train_valid) begin
        PHT_8 <= Counter2bc_8_state;
      end else if (predict_valid) begin
        PHT_8 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_9 <= 2'h1;
    end else if (btb_index == 7'h9) begin
      if (train_mispredicted & train_valid) begin
        PHT_9 <= Counter2bc_9_state;
      end else if (predict_valid) begin
        PHT_9 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_10 <= 2'h1;
    end else if (btb_index == 7'ha) begin
      if (train_mispredicted & train_valid) begin
        PHT_10 <= Counter2bc_10_state;
      end else if (predict_valid) begin
        PHT_10 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_11 <= 2'h1;
    end else if (btb_index == 7'hb) begin
      if (train_mispredicted & train_valid) begin
        PHT_11 <= Counter2bc_11_state;
      end else if (predict_valid) begin
        PHT_11 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_12 <= 2'h1;
    end else if (btb_index == 7'hc) begin
      if (train_mispredicted & train_valid) begin
        PHT_12 <= Counter2bc_12_state;
      end else if (predict_valid) begin
        PHT_12 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_13 <= 2'h1;
    end else if (btb_index == 7'hd) begin
      if (train_mispredicted & train_valid) begin
        PHT_13 <= Counter2bc_13_state;
      end else if (predict_valid) begin
        PHT_13 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_14 <= 2'h1;
    end else if (btb_index == 7'he) begin
      if (train_mispredicted & train_valid) begin
        PHT_14 <= Counter2bc_14_state;
      end else if (predict_valid) begin
        PHT_14 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_15 <= 2'h1;
    end else if (btb_index == 7'hf) begin
      if (train_mispredicted & train_valid) begin
        PHT_15 <= Counter2bc_15_state;
      end else if (predict_valid) begin
        PHT_15 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_16 <= 2'h1;
    end else if (btb_index == 7'h10) begin
      if (train_mispredicted & train_valid) begin
        PHT_16 <= Counter2bc_16_state;
      end else if (predict_valid) begin
        PHT_16 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_17 <= 2'h1;
    end else if (btb_index == 7'h11) begin
      if (train_mispredicted & train_valid) begin
        PHT_17 <= Counter2bc_17_state;
      end else if (predict_valid) begin
        PHT_17 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_18 <= 2'h1;
    end else if (btb_index == 7'h12) begin
      if (train_mispredicted & train_valid) begin
        PHT_18 <= Counter2bc_18_state;
      end else if (predict_valid) begin
        PHT_18 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_19 <= 2'h1;
    end else if (btb_index == 7'h13) begin
      if (train_mispredicted & train_valid) begin
        PHT_19 <= Counter2bc_19_state;
      end else if (predict_valid) begin
        PHT_19 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_20 <= 2'h1;
    end else if (btb_index == 7'h14) begin
      if (train_mispredicted & train_valid) begin
        PHT_20 <= Counter2bc_20_state;
      end else if (predict_valid) begin
        PHT_20 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_21 <= 2'h1;
    end else if (btb_index == 7'h15) begin
      if (train_mispredicted & train_valid) begin
        PHT_21 <= Counter2bc_21_state;
      end else if (predict_valid) begin
        PHT_21 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_22 <= 2'h1;
    end else if (btb_index == 7'h16) begin
      if (train_mispredicted & train_valid) begin
        PHT_22 <= Counter2bc_22_state;
      end else if (predict_valid) begin
        PHT_22 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_23 <= 2'h1;
    end else if (btb_index == 7'h17) begin
      if (train_mispredicted & train_valid) begin
        PHT_23 <= Counter2bc_23_state;
      end else if (predict_valid) begin
        PHT_23 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_24 <= 2'h1;
    end else if (btb_index == 7'h18) begin
      if (train_mispredicted & train_valid) begin
        PHT_24 <= Counter2bc_24_state;
      end else if (predict_valid) begin
        PHT_24 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_25 <= 2'h1;
    end else if (btb_index == 7'h19) begin
      if (train_mispredicted & train_valid) begin
        PHT_25 <= Counter2bc_25_state;
      end else if (predict_valid) begin
        PHT_25 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_26 <= 2'h1;
    end else if (btb_index == 7'h1a) begin
      if (train_mispredicted & train_valid) begin
        PHT_26 <= Counter2bc_26_state;
      end else if (predict_valid) begin
        PHT_26 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_27 <= 2'h1;
    end else if (btb_index == 7'h1b) begin
      if (train_mispredicted & train_valid) begin
        PHT_27 <= Counter2bc_27_state;
      end else if (predict_valid) begin
        PHT_27 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_28 <= 2'h1;
    end else if (btb_index == 7'h1c) begin
      if (train_mispredicted & train_valid) begin
        PHT_28 <= Counter2bc_28_state;
      end else if (predict_valid) begin
        PHT_28 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_29 <= 2'h1;
    end else if (btb_index == 7'h1d) begin
      if (train_mispredicted & train_valid) begin
        PHT_29 <= Counter2bc_29_state;
      end else if (predict_valid) begin
        PHT_29 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_30 <= 2'h1;
    end else if (btb_index == 7'h1e) begin
      if (train_mispredicted & train_valid) begin
        PHT_30 <= Counter2bc_30_state;
      end else if (predict_valid) begin
        PHT_30 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_31 <= 2'h1;
    end else if (btb_index == 7'h1f) begin
      if (train_mispredicted & train_valid) begin
        PHT_31 <= Counter2bc_31_state;
      end else if (predict_valid) begin
        PHT_31 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_32 <= 2'h1;
    end else if (btb_index == 7'h20) begin
      if (train_mispredicted & train_valid) begin
        PHT_32 <= Counter2bc_32_state;
      end else if (predict_valid) begin
        PHT_32 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_33 <= 2'h1;
    end else if (btb_index == 7'h21) begin
      if (train_mispredicted & train_valid) begin
        PHT_33 <= Counter2bc_33_state;
      end else if (predict_valid) begin
        PHT_33 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_34 <= 2'h1;
    end else if (btb_index == 7'h22) begin
      if (train_mispredicted & train_valid) begin
        PHT_34 <= Counter2bc_34_state;
      end else if (predict_valid) begin
        PHT_34 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_35 <= 2'h1;
    end else if (btb_index == 7'h23) begin
      if (train_mispredicted & train_valid) begin
        PHT_35 <= Counter2bc_35_state;
      end else if (predict_valid) begin
        PHT_35 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_36 <= 2'h1;
    end else if (btb_index == 7'h24) begin
      if (train_mispredicted & train_valid) begin
        PHT_36 <= Counter2bc_36_state;
      end else if (predict_valid) begin
        PHT_36 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_37 <= 2'h1;
    end else if (btb_index == 7'h25) begin
      if (train_mispredicted & train_valid) begin
        PHT_37 <= Counter2bc_37_state;
      end else if (predict_valid) begin
        PHT_37 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_38 <= 2'h1;
    end else if (btb_index == 7'h26) begin
      if (train_mispredicted & train_valid) begin
        PHT_38 <= Counter2bc_38_state;
      end else if (predict_valid) begin
        PHT_38 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_39 <= 2'h1;
    end else if (btb_index == 7'h27) begin
      if (train_mispredicted & train_valid) begin
        PHT_39 <= Counter2bc_39_state;
      end else if (predict_valid) begin
        PHT_39 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_40 <= 2'h1;
    end else if (btb_index == 7'h28) begin
      if (train_mispredicted & train_valid) begin
        PHT_40 <= Counter2bc_40_state;
      end else if (predict_valid) begin
        PHT_40 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_41 <= 2'h1;
    end else if (btb_index == 7'h29) begin
      if (train_mispredicted & train_valid) begin
        PHT_41 <= Counter2bc_41_state;
      end else if (predict_valid) begin
        PHT_41 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_42 <= 2'h1;
    end else if (btb_index == 7'h2a) begin
      if (train_mispredicted & train_valid) begin
        PHT_42 <= Counter2bc_42_state;
      end else if (predict_valid) begin
        PHT_42 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_43 <= 2'h1;
    end else if (btb_index == 7'h2b) begin
      if (train_mispredicted & train_valid) begin
        PHT_43 <= Counter2bc_43_state;
      end else if (predict_valid) begin
        PHT_43 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_44 <= 2'h1;
    end else if (btb_index == 7'h2c) begin
      if (train_mispredicted & train_valid) begin
        PHT_44 <= Counter2bc_44_state;
      end else if (predict_valid) begin
        PHT_44 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_45 <= 2'h1;
    end else if (btb_index == 7'h2d) begin
      if (train_mispredicted & train_valid) begin
        PHT_45 <= Counter2bc_45_state;
      end else if (predict_valid) begin
        PHT_45 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_46 <= 2'h1;
    end else if (btb_index == 7'h2e) begin
      if (train_mispredicted & train_valid) begin
        PHT_46 <= Counter2bc_46_state;
      end else if (predict_valid) begin
        PHT_46 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_47 <= 2'h1;
    end else if (btb_index == 7'h2f) begin
      if (train_mispredicted & train_valid) begin
        PHT_47 <= Counter2bc_47_state;
      end else if (predict_valid) begin
        PHT_47 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_48 <= 2'h1;
    end else if (btb_index == 7'h30) begin
      if (train_mispredicted & train_valid) begin
        PHT_48 <= Counter2bc_48_state;
      end else if (predict_valid) begin
        PHT_48 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_49 <= 2'h1;
    end else if (btb_index == 7'h31) begin
      if (train_mispredicted & train_valid) begin
        PHT_49 <= Counter2bc_49_state;
      end else if (predict_valid) begin
        PHT_49 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_50 <= 2'h1;
    end else if (btb_index == 7'h32) begin
      if (train_mispredicted & train_valid) begin
        PHT_50 <= Counter2bc_50_state;
      end else if (predict_valid) begin
        PHT_50 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_51 <= 2'h1;
    end else if (btb_index == 7'h33) begin
      if (train_mispredicted & train_valid) begin
        PHT_51 <= Counter2bc_51_state;
      end else if (predict_valid) begin
        PHT_51 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_52 <= 2'h1;
    end else if (btb_index == 7'h34) begin
      if (train_mispredicted & train_valid) begin
        PHT_52 <= Counter2bc_52_state;
      end else if (predict_valid) begin
        PHT_52 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_53 <= 2'h1;
    end else if (btb_index == 7'h35) begin
      if (train_mispredicted & train_valid) begin
        PHT_53 <= Counter2bc_53_state;
      end else if (predict_valid) begin
        PHT_53 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_54 <= 2'h1;
    end else if (btb_index == 7'h36) begin
      if (train_mispredicted & train_valid) begin
        PHT_54 <= Counter2bc_54_state;
      end else if (predict_valid) begin
        PHT_54 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_55 <= 2'h1;
    end else if (btb_index == 7'h37) begin
      if (train_mispredicted & train_valid) begin
        PHT_55 <= Counter2bc_55_state;
      end else if (predict_valid) begin
        PHT_55 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_56 <= 2'h1;
    end else if (btb_index == 7'h38) begin
      if (train_mispredicted & train_valid) begin
        PHT_56 <= Counter2bc_56_state;
      end else if (predict_valid) begin
        PHT_56 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_57 <= 2'h1;
    end else if (btb_index == 7'h39) begin
      if (train_mispredicted & train_valid) begin
        PHT_57 <= Counter2bc_57_state;
      end else if (predict_valid) begin
        PHT_57 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_58 <= 2'h1;
    end else if (btb_index == 7'h3a) begin
      if (train_mispredicted & train_valid) begin
        PHT_58 <= Counter2bc_58_state;
      end else if (predict_valid) begin
        PHT_58 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_59 <= 2'h1;
    end else if (btb_index == 7'h3b) begin
      if (train_mispredicted & train_valid) begin
        PHT_59 <= Counter2bc_59_state;
      end else if (predict_valid) begin
        PHT_59 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_60 <= 2'h1;
    end else if (btb_index == 7'h3c) begin
      if (train_mispredicted & train_valid) begin
        PHT_60 <= Counter2bc_60_state;
      end else if (predict_valid) begin
        PHT_60 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_61 <= 2'h1;
    end else if (btb_index == 7'h3d) begin
      if (train_mispredicted & train_valid) begin
        PHT_61 <= Counter2bc_61_state;
      end else if (predict_valid) begin
        PHT_61 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_62 <= 2'h1;
    end else if (btb_index == 7'h3e) begin
      if (train_mispredicted & train_valid) begin
        PHT_62 <= Counter2bc_62_state;
      end else if (predict_valid) begin
        PHT_62 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_63 <= 2'h1;
    end else if (btb_index == 7'h3f) begin
      if (train_mispredicted & train_valid) begin
        PHT_63 <= Counter2bc_63_state;
      end else if (predict_valid) begin
        PHT_63 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_64 <= 2'h1;
    end else if (btb_index == 7'h40) begin
      if (train_mispredicted & train_valid) begin
        PHT_64 <= Counter2bc_64_state;
      end else if (predict_valid) begin
        PHT_64 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_65 <= 2'h1;
    end else if (btb_index == 7'h41) begin
      if (train_mispredicted & train_valid) begin
        PHT_65 <= Counter2bc_65_state;
      end else if (predict_valid) begin
        PHT_65 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_66 <= 2'h1;
    end else if (btb_index == 7'h42) begin
      if (train_mispredicted & train_valid) begin
        PHT_66 <= Counter2bc_66_state;
      end else if (predict_valid) begin
        PHT_66 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_67 <= 2'h1;
    end else if (btb_index == 7'h43) begin
      if (train_mispredicted & train_valid) begin
        PHT_67 <= Counter2bc_67_state;
      end else if (predict_valid) begin
        PHT_67 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_68 <= 2'h1;
    end else if (btb_index == 7'h44) begin
      if (train_mispredicted & train_valid) begin
        PHT_68 <= Counter2bc_68_state;
      end else if (predict_valid) begin
        PHT_68 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_69 <= 2'h1;
    end else if (btb_index == 7'h45) begin
      if (train_mispredicted & train_valid) begin
        PHT_69 <= Counter2bc_69_state;
      end else if (predict_valid) begin
        PHT_69 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_70 <= 2'h1;
    end else if (btb_index == 7'h46) begin
      if (train_mispredicted & train_valid) begin
        PHT_70 <= Counter2bc_70_state;
      end else if (predict_valid) begin
        PHT_70 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_71 <= 2'h1;
    end else if (btb_index == 7'h47) begin
      if (train_mispredicted & train_valid) begin
        PHT_71 <= Counter2bc_71_state;
      end else if (predict_valid) begin
        PHT_71 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_72 <= 2'h1;
    end else if (btb_index == 7'h48) begin
      if (train_mispredicted & train_valid) begin
        PHT_72 <= Counter2bc_72_state;
      end else if (predict_valid) begin
        PHT_72 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_73 <= 2'h1;
    end else if (btb_index == 7'h49) begin
      if (train_mispredicted & train_valid) begin
        PHT_73 <= Counter2bc_73_state;
      end else if (predict_valid) begin
        PHT_73 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_74 <= 2'h1;
    end else if (btb_index == 7'h4a) begin
      if (train_mispredicted & train_valid) begin
        PHT_74 <= Counter2bc_74_state;
      end else if (predict_valid) begin
        PHT_74 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_75 <= 2'h1;
    end else if (btb_index == 7'h4b) begin
      if (train_mispredicted & train_valid) begin
        PHT_75 <= Counter2bc_75_state;
      end else if (predict_valid) begin
        PHT_75 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_76 <= 2'h1;
    end else if (btb_index == 7'h4c) begin
      if (train_mispredicted & train_valid) begin
        PHT_76 <= Counter2bc_76_state;
      end else if (predict_valid) begin
        PHT_76 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_77 <= 2'h1;
    end else if (btb_index == 7'h4d) begin
      if (train_mispredicted & train_valid) begin
        PHT_77 <= Counter2bc_77_state;
      end else if (predict_valid) begin
        PHT_77 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_78 <= 2'h1;
    end else if (btb_index == 7'h4e) begin
      if (train_mispredicted & train_valid) begin
        PHT_78 <= Counter2bc_78_state;
      end else if (predict_valid) begin
        PHT_78 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_79 <= 2'h1;
    end else if (btb_index == 7'h4f) begin
      if (train_mispredicted & train_valid) begin
        PHT_79 <= Counter2bc_79_state;
      end else if (predict_valid) begin
        PHT_79 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_80 <= 2'h1;
    end else if (btb_index == 7'h50) begin
      if (train_mispredicted & train_valid) begin
        PHT_80 <= Counter2bc_80_state;
      end else if (predict_valid) begin
        PHT_80 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_81 <= 2'h1;
    end else if (btb_index == 7'h51) begin
      if (train_mispredicted & train_valid) begin
        PHT_81 <= Counter2bc_81_state;
      end else if (predict_valid) begin
        PHT_81 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_82 <= 2'h1;
    end else if (btb_index == 7'h52) begin
      if (train_mispredicted & train_valid) begin
        PHT_82 <= Counter2bc_82_state;
      end else if (predict_valid) begin
        PHT_82 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_83 <= 2'h1;
    end else if (btb_index == 7'h53) begin
      if (train_mispredicted & train_valid) begin
        PHT_83 <= Counter2bc_83_state;
      end else if (predict_valid) begin
        PHT_83 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_84 <= 2'h1;
    end else if (btb_index == 7'h54) begin
      if (train_mispredicted & train_valid) begin
        PHT_84 <= Counter2bc_84_state;
      end else if (predict_valid) begin
        PHT_84 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_85 <= 2'h1;
    end else if (btb_index == 7'h55) begin
      if (train_mispredicted & train_valid) begin
        PHT_85 <= Counter2bc_85_state;
      end else if (predict_valid) begin
        PHT_85 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_86 <= 2'h1;
    end else if (btb_index == 7'h56) begin
      if (train_mispredicted & train_valid) begin
        PHT_86 <= Counter2bc_86_state;
      end else if (predict_valid) begin
        PHT_86 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_87 <= 2'h1;
    end else if (btb_index == 7'h57) begin
      if (train_mispredicted & train_valid) begin
        PHT_87 <= Counter2bc_87_state;
      end else if (predict_valid) begin
        PHT_87 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_88 <= 2'h1;
    end else if (btb_index == 7'h58) begin
      if (train_mispredicted & train_valid) begin
        PHT_88 <= Counter2bc_88_state;
      end else if (predict_valid) begin
        PHT_88 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_89 <= 2'h1;
    end else if (btb_index == 7'h59) begin
      if (train_mispredicted & train_valid) begin
        PHT_89 <= Counter2bc_89_state;
      end else if (predict_valid) begin
        PHT_89 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_90 <= 2'h1;
    end else if (btb_index == 7'h5a) begin
      if (train_mispredicted & train_valid) begin
        PHT_90 <= Counter2bc_90_state;
      end else if (predict_valid) begin
        PHT_90 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_91 <= 2'h1;
    end else if (btb_index == 7'h5b) begin
      if (train_mispredicted & train_valid) begin
        PHT_91 <= Counter2bc_91_state;
      end else if (predict_valid) begin
        PHT_91 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_92 <= 2'h1;
    end else if (btb_index == 7'h5c) begin
      if (train_mispredicted & train_valid) begin
        PHT_92 <= Counter2bc_92_state;
      end else if (predict_valid) begin
        PHT_92 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_93 <= 2'h1;
    end else if (btb_index == 7'h5d) begin
      if (train_mispredicted & train_valid) begin
        PHT_93 <= Counter2bc_93_state;
      end else if (predict_valid) begin
        PHT_93 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_94 <= 2'h1;
    end else if (btb_index == 7'h5e) begin
      if (train_mispredicted & train_valid) begin
        PHT_94 <= Counter2bc_94_state;
      end else if (predict_valid) begin
        PHT_94 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_95 <= 2'h1;
    end else if (btb_index == 7'h5f) begin
      if (train_mispredicted & train_valid) begin
        PHT_95 <= Counter2bc_95_state;
      end else if (predict_valid) begin
        PHT_95 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_96 <= 2'h1;
    end else if (btb_index == 7'h60) begin
      if (train_mispredicted & train_valid) begin
        PHT_96 <= Counter2bc_96_state;
      end else if (predict_valid) begin
        PHT_96 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_97 <= 2'h1;
    end else if (btb_index == 7'h61) begin
      if (train_mispredicted & train_valid) begin
        PHT_97 <= Counter2bc_97_state;
      end else if (predict_valid) begin
        PHT_97 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_98 <= 2'h1;
    end else if (btb_index == 7'h62) begin
      if (train_mispredicted & train_valid) begin
        PHT_98 <= Counter2bc_98_state;
      end else if (predict_valid) begin
        PHT_98 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_99 <= 2'h1;
    end else if (btb_index == 7'h63) begin
      if (train_mispredicted & train_valid) begin
        PHT_99 <= Counter2bc_99_state;
      end else if (predict_valid) begin
        PHT_99 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_100 <= 2'h1;
    end else if (btb_index == 7'h64) begin
      if (train_mispredicted & train_valid) begin
        PHT_100 <= Counter2bc_100_state;
      end else if (predict_valid) begin
        PHT_100 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_101 <= 2'h1;
    end else if (btb_index == 7'h65) begin
      if (train_mispredicted & train_valid) begin
        PHT_101 <= Counter2bc_101_state;
      end else if (predict_valid) begin
        PHT_101 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_102 <= 2'h1;
    end else if (btb_index == 7'h66) begin
      if (train_mispredicted & train_valid) begin
        PHT_102 <= Counter2bc_102_state;
      end else if (predict_valid) begin
        PHT_102 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_103 <= 2'h1;
    end else if (btb_index == 7'h67) begin
      if (train_mispredicted & train_valid) begin
        PHT_103 <= Counter2bc_103_state;
      end else if (predict_valid) begin
        PHT_103 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_104 <= 2'h1;
    end else if (btb_index == 7'h68) begin
      if (train_mispredicted & train_valid) begin
        PHT_104 <= Counter2bc_104_state;
      end else if (predict_valid) begin
        PHT_104 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_105 <= 2'h1;
    end else if (btb_index == 7'h69) begin
      if (train_mispredicted & train_valid) begin
        PHT_105 <= Counter2bc_105_state;
      end else if (predict_valid) begin
        PHT_105 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_106 <= 2'h1;
    end else if (btb_index == 7'h6a) begin
      if (train_mispredicted & train_valid) begin
        PHT_106 <= Counter2bc_106_state;
      end else if (predict_valid) begin
        PHT_106 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_107 <= 2'h1;
    end else if (btb_index == 7'h6b) begin
      if (train_mispredicted & train_valid) begin
        PHT_107 <= Counter2bc_107_state;
      end else if (predict_valid) begin
        PHT_107 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_108 <= 2'h1;
    end else if (btb_index == 7'h6c) begin
      if (train_mispredicted & train_valid) begin
        PHT_108 <= Counter2bc_108_state;
      end else if (predict_valid) begin
        PHT_108 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_109 <= 2'h1;
    end else if (btb_index == 7'h6d) begin
      if (train_mispredicted & train_valid) begin
        PHT_109 <= Counter2bc_109_state;
      end else if (predict_valid) begin
        PHT_109 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_110 <= 2'h1;
    end else if (btb_index == 7'h6e) begin
      if (train_mispredicted & train_valid) begin
        PHT_110 <= Counter2bc_110_state;
      end else if (predict_valid) begin
        PHT_110 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_111 <= 2'h1;
    end else if (btb_index == 7'h6f) begin
      if (train_mispredicted & train_valid) begin
        PHT_111 <= Counter2bc_111_state;
      end else if (predict_valid) begin
        PHT_111 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_112 <= 2'h1;
    end else if (btb_index == 7'h70) begin
      if (train_mispredicted & train_valid) begin
        PHT_112 <= Counter2bc_112_state;
      end else if (predict_valid) begin
        PHT_112 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_113 <= 2'h1;
    end else if (btb_index == 7'h71) begin
      if (train_mispredicted & train_valid) begin
        PHT_113 <= Counter2bc_113_state;
      end else if (predict_valid) begin
        PHT_113 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_114 <= 2'h1;
    end else if (btb_index == 7'h72) begin
      if (train_mispredicted & train_valid) begin
        PHT_114 <= Counter2bc_114_state;
      end else if (predict_valid) begin
        PHT_114 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_115 <= 2'h1;
    end else if (btb_index == 7'h73) begin
      if (train_mispredicted & train_valid) begin
        PHT_115 <= Counter2bc_115_state;
      end else if (predict_valid) begin
        PHT_115 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_116 <= 2'h1;
    end else if (btb_index == 7'h74) begin
      if (train_mispredicted & train_valid) begin
        PHT_116 <= Counter2bc_116_state;
      end else if (predict_valid) begin
        PHT_116 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_117 <= 2'h1;
    end else if (btb_index == 7'h75) begin
      if (train_mispredicted & train_valid) begin
        PHT_117 <= Counter2bc_117_state;
      end else if (predict_valid) begin
        PHT_117 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_118 <= 2'h1;
    end else if (btb_index == 7'h76) begin
      if (train_mispredicted & train_valid) begin
        PHT_118 <= Counter2bc_118_state;
      end else if (predict_valid) begin
        PHT_118 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_119 <= 2'h1;
    end else if (btb_index == 7'h77) begin
      if (train_mispredicted & train_valid) begin
        PHT_119 <= Counter2bc_119_state;
      end else if (predict_valid) begin
        PHT_119 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_120 <= 2'h1;
    end else if (btb_index == 7'h78) begin
      if (train_mispredicted & train_valid) begin
        PHT_120 <= Counter2bc_120_state;
      end else if (predict_valid) begin
        PHT_120 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_121 <= 2'h1;
    end else if (btb_index == 7'h79) begin
      if (train_mispredicted & train_valid) begin
        PHT_121 <= Counter2bc_121_state;
      end else if (predict_valid) begin
        PHT_121 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_122 <= 2'h1;
    end else if (btb_index == 7'h7a) begin
      if (train_mispredicted & train_valid) begin
        PHT_122 <= Counter2bc_122_state;
      end else if (predict_valid) begin
        PHT_122 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_123 <= 2'h1;
    end else if (btb_index == 7'h7b) begin
      if (train_mispredicted & train_valid) begin
        PHT_123 <= Counter2bc_123_state;
      end else if (predict_valid) begin
        PHT_123 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_124 <= 2'h1;
    end else if (btb_index == 7'h7c) begin
      if (train_mispredicted & train_valid) begin
        PHT_124 <= Counter2bc_124_state;
      end else if (predict_valid) begin
        PHT_124 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_125 <= 2'h1;
    end else if (btb_index == 7'h7d) begin
      if (train_mispredicted & train_valid) begin
        PHT_125 <= Counter2bc_125_state;
      end else if (predict_valid) begin
        PHT_125 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_126 <= 2'h1;
    end else if (btb_index == 7'h7e) begin
      if (train_mispredicted & train_valid) begin
        PHT_126 <= Counter2bc_126_state;
      end else if (predict_valid) begin
        PHT_126 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      PHT_127 <= 2'h1;
    end else if (btb_index == 7'h7f) begin
      if (train_mispredicted & train_valid) begin
        PHT_127 <= Counter2bc_127_state;
      end else if (predict_valid) begin
        PHT_127 <= {{1'd0}, predict_taken};
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_0 <= 7'h0;
    end else if (btb_index == 7'h0) begin
      if (train_mispredicted & train_valid) begin
        BTB_0 <= train_pc;
      end else if (predict_valid) begin
        BTB_0 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_1 <= 7'h0;
    end else if (btb_index == 7'h1) begin
      if (train_mispredicted & train_valid) begin
        BTB_1 <= train_pc;
      end else if (predict_valid) begin
        BTB_1 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_2 <= 7'h0;
    end else if (btb_index == 7'h2) begin
      if (train_mispredicted & train_valid) begin
        BTB_2 <= train_pc;
      end else if (predict_valid) begin
        BTB_2 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_3 <= 7'h0;
    end else if (btb_index == 7'h3) begin
      if (train_mispredicted & train_valid) begin
        BTB_3 <= train_pc;
      end else if (predict_valid) begin
        BTB_3 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_4 <= 7'h0;
    end else if (btb_index == 7'h4) begin
      if (train_mispredicted & train_valid) begin
        BTB_4 <= train_pc;
      end else if (predict_valid) begin
        BTB_4 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_5 <= 7'h0;
    end else if (btb_index == 7'h5) begin
      if (train_mispredicted & train_valid) begin
        BTB_5 <= train_pc;
      end else if (predict_valid) begin
        BTB_5 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_6 <= 7'h0;
    end else if (btb_index == 7'h6) begin
      if (train_mispredicted & train_valid) begin
        BTB_6 <= train_pc;
      end else if (predict_valid) begin
        BTB_6 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_7 <= 7'h0;
    end else if (btb_index == 7'h7) begin
      if (train_mispredicted & train_valid) begin
        BTB_7 <= train_pc;
      end else if (predict_valid) begin
        BTB_7 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_8 <= 7'h0;
    end else if (btb_index == 7'h8) begin
      if (train_mispredicted & train_valid) begin
        BTB_8 <= train_pc;
      end else if (predict_valid) begin
        BTB_8 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_9 <= 7'h0;
    end else if (btb_index == 7'h9) begin
      if (train_mispredicted & train_valid) begin
        BTB_9 <= train_pc;
      end else if (predict_valid) begin
        BTB_9 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_10 <= 7'h0;
    end else if (btb_index == 7'ha) begin
      if (train_mispredicted & train_valid) begin
        BTB_10 <= train_pc;
      end else if (predict_valid) begin
        BTB_10 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_11 <= 7'h0;
    end else if (btb_index == 7'hb) begin
      if (train_mispredicted & train_valid) begin
        BTB_11 <= train_pc;
      end else if (predict_valid) begin
        BTB_11 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_12 <= 7'h0;
    end else if (btb_index == 7'hc) begin
      if (train_mispredicted & train_valid) begin
        BTB_12 <= train_pc;
      end else if (predict_valid) begin
        BTB_12 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_13 <= 7'h0;
    end else if (btb_index == 7'hd) begin
      if (train_mispredicted & train_valid) begin
        BTB_13 <= train_pc;
      end else if (predict_valid) begin
        BTB_13 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_14 <= 7'h0;
    end else if (btb_index == 7'he) begin
      if (train_mispredicted & train_valid) begin
        BTB_14 <= train_pc;
      end else if (predict_valid) begin
        BTB_14 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_15 <= 7'h0;
    end else if (btb_index == 7'hf) begin
      if (train_mispredicted & train_valid) begin
        BTB_15 <= train_pc;
      end else if (predict_valid) begin
        BTB_15 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_16 <= 7'h0;
    end else if (btb_index == 7'h10) begin
      if (train_mispredicted & train_valid) begin
        BTB_16 <= train_pc;
      end else if (predict_valid) begin
        BTB_16 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_17 <= 7'h0;
    end else if (btb_index == 7'h11) begin
      if (train_mispredicted & train_valid) begin
        BTB_17 <= train_pc;
      end else if (predict_valid) begin
        BTB_17 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_18 <= 7'h0;
    end else if (btb_index == 7'h12) begin
      if (train_mispredicted & train_valid) begin
        BTB_18 <= train_pc;
      end else if (predict_valid) begin
        BTB_18 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_19 <= 7'h0;
    end else if (btb_index == 7'h13) begin
      if (train_mispredicted & train_valid) begin
        BTB_19 <= train_pc;
      end else if (predict_valid) begin
        BTB_19 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_20 <= 7'h0;
    end else if (btb_index == 7'h14) begin
      if (train_mispredicted & train_valid) begin
        BTB_20 <= train_pc;
      end else if (predict_valid) begin
        BTB_20 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_21 <= 7'h0;
    end else if (btb_index == 7'h15) begin
      if (train_mispredicted & train_valid) begin
        BTB_21 <= train_pc;
      end else if (predict_valid) begin
        BTB_21 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_22 <= 7'h0;
    end else if (btb_index == 7'h16) begin
      if (train_mispredicted & train_valid) begin
        BTB_22 <= train_pc;
      end else if (predict_valid) begin
        BTB_22 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_23 <= 7'h0;
    end else if (btb_index == 7'h17) begin
      if (train_mispredicted & train_valid) begin
        BTB_23 <= train_pc;
      end else if (predict_valid) begin
        BTB_23 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_24 <= 7'h0;
    end else if (btb_index == 7'h18) begin
      if (train_mispredicted & train_valid) begin
        BTB_24 <= train_pc;
      end else if (predict_valid) begin
        BTB_24 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_25 <= 7'h0;
    end else if (btb_index == 7'h19) begin
      if (train_mispredicted & train_valid) begin
        BTB_25 <= train_pc;
      end else if (predict_valid) begin
        BTB_25 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_26 <= 7'h0;
    end else if (btb_index == 7'h1a) begin
      if (train_mispredicted & train_valid) begin
        BTB_26 <= train_pc;
      end else if (predict_valid) begin
        BTB_26 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_27 <= 7'h0;
    end else if (btb_index == 7'h1b) begin
      if (train_mispredicted & train_valid) begin
        BTB_27 <= train_pc;
      end else if (predict_valid) begin
        BTB_27 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_28 <= 7'h0;
    end else if (btb_index == 7'h1c) begin
      if (train_mispredicted & train_valid) begin
        BTB_28 <= train_pc;
      end else if (predict_valid) begin
        BTB_28 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_29 <= 7'h0;
    end else if (btb_index == 7'h1d) begin
      if (train_mispredicted & train_valid) begin
        BTB_29 <= train_pc;
      end else if (predict_valid) begin
        BTB_29 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_30 <= 7'h0;
    end else if (btb_index == 7'h1e) begin
      if (train_mispredicted & train_valid) begin
        BTB_30 <= train_pc;
      end else if (predict_valid) begin
        BTB_30 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_31 <= 7'h0;
    end else if (btb_index == 7'h1f) begin
      if (train_mispredicted & train_valid) begin
        BTB_31 <= train_pc;
      end else if (predict_valid) begin
        BTB_31 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_32 <= 7'h0;
    end else if (btb_index == 7'h20) begin
      if (train_mispredicted & train_valid) begin
        BTB_32 <= train_pc;
      end else if (predict_valid) begin
        BTB_32 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_33 <= 7'h0;
    end else if (btb_index == 7'h21) begin
      if (train_mispredicted & train_valid) begin
        BTB_33 <= train_pc;
      end else if (predict_valid) begin
        BTB_33 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_34 <= 7'h0;
    end else if (btb_index == 7'h22) begin
      if (train_mispredicted & train_valid) begin
        BTB_34 <= train_pc;
      end else if (predict_valid) begin
        BTB_34 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_35 <= 7'h0;
    end else if (btb_index == 7'h23) begin
      if (train_mispredicted & train_valid) begin
        BTB_35 <= train_pc;
      end else if (predict_valid) begin
        BTB_35 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_36 <= 7'h0;
    end else if (btb_index == 7'h24) begin
      if (train_mispredicted & train_valid) begin
        BTB_36 <= train_pc;
      end else if (predict_valid) begin
        BTB_36 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_37 <= 7'h0;
    end else if (btb_index == 7'h25) begin
      if (train_mispredicted & train_valid) begin
        BTB_37 <= train_pc;
      end else if (predict_valid) begin
        BTB_37 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_38 <= 7'h0;
    end else if (btb_index == 7'h26) begin
      if (train_mispredicted & train_valid) begin
        BTB_38 <= train_pc;
      end else if (predict_valid) begin
        BTB_38 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_39 <= 7'h0;
    end else if (btb_index == 7'h27) begin
      if (train_mispredicted & train_valid) begin
        BTB_39 <= train_pc;
      end else if (predict_valid) begin
        BTB_39 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_40 <= 7'h0;
    end else if (btb_index == 7'h28) begin
      if (train_mispredicted & train_valid) begin
        BTB_40 <= train_pc;
      end else if (predict_valid) begin
        BTB_40 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_41 <= 7'h0;
    end else if (btb_index == 7'h29) begin
      if (train_mispredicted & train_valid) begin
        BTB_41 <= train_pc;
      end else if (predict_valid) begin
        BTB_41 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_42 <= 7'h0;
    end else if (btb_index == 7'h2a) begin
      if (train_mispredicted & train_valid) begin
        BTB_42 <= train_pc;
      end else if (predict_valid) begin
        BTB_42 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_43 <= 7'h0;
    end else if (btb_index == 7'h2b) begin
      if (train_mispredicted & train_valid) begin
        BTB_43 <= train_pc;
      end else if (predict_valid) begin
        BTB_43 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_44 <= 7'h0;
    end else if (btb_index == 7'h2c) begin
      if (train_mispredicted & train_valid) begin
        BTB_44 <= train_pc;
      end else if (predict_valid) begin
        BTB_44 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_45 <= 7'h0;
    end else if (btb_index == 7'h2d) begin
      if (train_mispredicted & train_valid) begin
        BTB_45 <= train_pc;
      end else if (predict_valid) begin
        BTB_45 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_46 <= 7'h0;
    end else if (btb_index == 7'h2e) begin
      if (train_mispredicted & train_valid) begin
        BTB_46 <= train_pc;
      end else if (predict_valid) begin
        BTB_46 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_47 <= 7'h0;
    end else if (btb_index == 7'h2f) begin
      if (train_mispredicted & train_valid) begin
        BTB_47 <= train_pc;
      end else if (predict_valid) begin
        BTB_47 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_48 <= 7'h0;
    end else if (btb_index == 7'h30) begin
      if (train_mispredicted & train_valid) begin
        BTB_48 <= train_pc;
      end else if (predict_valid) begin
        BTB_48 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_49 <= 7'h0;
    end else if (btb_index == 7'h31) begin
      if (train_mispredicted & train_valid) begin
        BTB_49 <= train_pc;
      end else if (predict_valid) begin
        BTB_49 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_50 <= 7'h0;
    end else if (btb_index == 7'h32) begin
      if (train_mispredicted & train_valid) begin
        BTB_50 <= train_pc;
      end else if (predict_valid) begin
        BTB_50 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_51 <= 7'h0;
    end else if (btb_index == 7'h33) begin
      if (train_mispredicted & train_valid) begin
        BTB_51 <= train_pc;
      end else if (predict_valid) begin
        BTB_51 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_52 <= 7'h0;
    end else if (btb_index == 7'h34) begin
      if (train_mispredicted & train_valid) begin
        BTB_52 <= train_pc;
      end else if (predict_valid) begin
        BTB_52 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_53 <= 7'h0;
    end else if (btb_index == 7'h35) begin
      if (train_mispredicted & train_valid) begin
        BTB_53 <= train_pc;
      end else if (predict_valid) begin
        BTB_53 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_54 <= 7'h0;
    end else if (btb_index == 7'h36) begin
      if (train_mispredicted & train_valid) begin
        BTB_54 <= train_pc;
      end else if (predict_valid) begin
        BTB_54 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_55 <= 7'h0;
    end else if (btb_index == 7'h37) begin
      if (train_mispredicted & train_valid) begin
        BTB_55 <= train_pc;
      end else if (predict_valid) begin
        BTB_55 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_56 <= 7'h0;
    end else if (btb_index == 7'h38) begin
      if (train_mispredicted & train_valid) begin
        BTB_56 <= train_pc;
      end else if (predict_valid) begin
        BTB_56 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_57 <= 7'h0;
    end else if (btb_index == 7'h39) begin
      if (train_mispredicted & train_valid) begin
        BTB_57 <= train_pc;
      end else if (predict_valid) begin
        BTB_57 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_58 <= 7'h0;
    end else if (btb_index == 7'h3a) begin
      if (train_mispredicted & train_valid) begin
        BTB_58 <= train_pc;
      end else if (predict_valid) begin
        BTB_58 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_59 <= 7'h0;
    end else if (btb_index == 7'h3b) begin
      if (train_mispredicted & train_valid) begin
        BTB_59 <= train_pc;
      end else if (predict_valid) begin
        BTB_59 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_60 <= 7'h0;
    end else if (btb_index == 7'h3c) begin
      if (train_mispredicted & train_valid) begin
        BTB_60 <= train_pc;
      end else if (predict_valid) begin
        BTB_60 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_61 <= 7'h0;
    end else if (btb_index == 7'h3d) begin
      if (train_mispredicted & train_valid) begin
        BTB_61 <= train_pc;
      end else if (predict_valid) begin
        BTB_61 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_62 <= 7'h0;
    end else if (btb_index == 7'h3e) begin
      if (train_mispredicted & train_valid) begin
        BTB_62 <= train_pc;
      end else if (predict_valid) begin
        BTB_62 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_63 <= 7'h0;
    end else if (btb_index == 7'h3f) begin
      if (train_mispredicted & train_valid) begin
        BTB_63 <= train_pc;
      end else if (predict_valid) begin
        BTB_63 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_64 <= 7'h0;
    end else if (btb_index == 7'h40) begin
      if (train_mispredicted & train_valid) begin
        BTB_64 <= train_pc;
      end else if (predict_valid) begin
        BTB_64 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_65 <= 7'h0;
    end else if (btb_index == 7'h41) begin
      if (train_mispredicted & train_valid) begin
        BTB_65 <= train_pc;
      end else if (predict_valid) begin
        BTB_65 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_66 <= 7'h0;
    end else if (btb_index == 7'h42) begin
      if (train_mispredicted & train_valid) begin
        BTB_66 <= train_pc;
      end else if (predict_valid) begin
        BTB_66 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_67 <= 7'h0;
    end else if (btb_index == 7'h43) begin
      if (train_mispredicted & train_valid) begin
        BTB_67 <= train_pc;
      end else if (predict_valid) begin
        BTB_67 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_68 <= 7'h0;
    end else if (btb_index == 7'h44) begin
      if (train_mispredicted & train_valid) begin
        BTB_68 <= train_pc;
      end else if (predict_valid) begin
        BTB_68 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_69 <= 7'h0;
    end else if (btb_index == 7'h45) begin
      if (train_mispredicted & train_valid) begin
        BTB_69 <= train_pc;
      end else if (predict_valid) begin
        BTB_69 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_70 <= 7'h0;
    end else if (btb_index == 7'h46) begin
      if (train_mispredicted & train_valid) begin
        BTB_70 <= train_pc;
      end else if (predict_valid) begin
        BTB_70 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_71 <= 7'h0;
    end else if (btb_index == 7'h47) begin
      if (train_mispredicted & train_valid) begin
        BTB_71 <= train_pc;
      end else if (predict_valid) begin
        BTB_71 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_72 <= 7'h0;
    end else if (btb_index == 7'h48) begin
      if (train_mispredicted & train_valid) begin
        BTB_72 <= train_pc;
      end else if (predict_valid) begin
        BTB_72 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_73 <= 7'h0;
    end else if (btb_index == 7'h49) begin
      if (train_mispredicted & train_valid) begin
        BTB_73 <= train_pc;
      end else if (predict_valid) begin
        BTB_73 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_74 <= 7'h0;
    end else if (btb_index == 7'h4a) begin
      if (train_mispredicted & train_valid) begin
        BTB_74 <= train_pc;
      end else if (predict_valid) begin
        BTB_74 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_75 <= 7'h0;
    end else if (btb_index == 7'h4b) begin
      if (train_mispredicted & train_valid) begin
        BTB_75 <= train_pc;
      end else if (predict_valid) begin
        BTB_75 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_76 <= 7'h0;
    end else if (btb_index == 7'h4c) begin
      if (train_mispredicted & train_valid) begin
        BTB_76 <= train_pc;
      end else if (predict_valid) begin
        BTB_76 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_77 <= 7'h0;
    end else if (btb_index == 7'h4d) begin
      if (train_mispredicted & train_valid) begin
        BTB_77 <= train_pc;
      end else if (predict_valid) begin
        BTB_77 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_78 <= 7'h0;
    end else if (btb_index == 7'h4e) begin
      if (train_mispredicted & train_valid) begin
        BTB_78 <= train_pc;
      end else if (predict_valid) begin
        BTB_78 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_79 <= 7'h0;
    end else if (btb_index == 7'h4f) begin
      if (train_mispredicted & train_valid) begin
        BTB_79 <= train_pc;
      end else if (predict_valid) begin
        BTB_79 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_80 <= 7'h0;
    end else if (btb_index == 7'h50) begin
      if (train_mispredicted & train_valid) begin
        BTB_80 <= train_pc;
      end else if (predict_valid) begin
        BTB_80 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_81 <= 7'h0;
    end else if (btb_index == 7'h51) begin
      if (train_mispredicted & train_valid) begin
        BTB_81 <= train_pc;
      end else if (predict_valid) begin
        BTB_81 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_82 <= 7'h0;
    end else if (btb_index == 7'h52) begin
      if (train_mispredicted & train_valid) begin
        BTB_82 <= train_pc;
      end else if (predict_valid) begin
        BTB_82 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_83 <= 7'h0;
    end else if (btb_index == 7'h53) begin
      if (train_mispredicted & train_valid) begin
        BTB_83 <= train_pc;
      end else if (predict_valid) begin
        BTB_83 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_84 <= 7'h0;
    end else if (btb_index == 7'h54) begin
      if (train_mispredicted & train_valid) begin
        BTB_84 <= train_pc;
      end else if (predict_valid) begin
        BTB_84 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_85 <= 7'h0;
    end else if (btb_index == 7'h55) begin
      if (train_mispredicted & train_valid) begin
        BTB_85 <= train_pc;
      end else if (predict_valid) begin
        BTB_85 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_86 <= 7'h0;
    end else if (btb_index == 7'h56) begin
      if (train_mispredicted & train_valid) begin
        BTB_86 <= train_pc;
      end else if (predict_valid) begin
        BTB_86 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_87 <= 7'h0;
    end else if (btb_index == 7'h57) begin
      if (train_mispredicted & train_valid) begin
        BTB_87 <= train_pc;
      end else if (predict_valid) begin
        BTB_87 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_88 <= 7'h0;
    end else if (btb_index == 7'h58) begin
      if (train_mispredicted & train_valid) begin
        BTB_88 <= train_pc;
      end else if (predict_valid) begin
        BTB_88 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_89 <= 7'h0;
    end else if (btb_index == 7'h59) begin
      if (train_mispredicted & train_valid) begin
        BTB_89 <= train_pc;
      end else if (predict_valid) begin
        BTB_89 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_90 <= 7'h0;
    end else if (btb_index == 7'h5a) begin
      if (train_mispredicted & train_valid) begin
        BTB_90 <= train_pc;
      end else if (predict_valid) begin
        BTB_90 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_91 <= 7'h0;
    end else if (btb_index == 7'h5b) begin
      if (train_mispredicted & train_valid) begin
        BTB_91 <= train_pc;
      end else if (predict_valid) begin
        BTB_91 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_92 <= 7'h0;
    end else if (btb_index == 7'h5c) begin
      if (train_mispredicted & train_valid) begin
        BTB_92 <= train_pc;
      end else if (predict_valid) begin
        BTB_92 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_93 <= 7'h0;
    end else if (btb_index == 7'h5d) begin
      if (train_mispredicted & train_valid) begin
        BTB_93 <= train_pc;
      end else if (predict_valid) begin
        BTB_93 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_94 <= 7'h0;
    end else if (btb_index == 7'h5e) begin
      if (train_mispredicted & train_valid) begin
        BTB_94 <= train_pc;
      end else if (predict_valid) begin
        BTB_94 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_95 <= 7'h0;
    end else if (btb_index == 7'h5f) begin
      if (train_mispredicted & train_valid) begin
        BTB_95 <= train_pc;
      end else if (predict_valid) begin
        BTB_95 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_96 <= 7'h0;
    end else if (btb_index == 7'h60) begin
      if (train_mispredicted & train_valid) begin
        BTB_96 <= train_pc;
      end else if (predict_valid) begin
        BTB_96 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_97 <= 7'h0;
    end else if (btb_index == 7'h61) begin
      if (train_mispredicted & train_valid) begin
        BTB_97 <= train_pc;
      end else if (predict_valid) begin
        BTB_97 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_98 <= 7'h0;
    end else if (btb_index == 7'h62) begin
      if (train_mispredicted & train_valid) begin
        BTB_98 <= train_pc;
      end else if (predict_valid) begin
        BTB_98 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_99 <= 7'h0;
    end else if (btb_index == 7'h63) begin
      if (train_mispredicted & train_valid) begin
        BTB_99 <= train_pc;
      end else if (predict_valid) begin
        BTB_99 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_100 <= 7'h0;
    end else if (btb_index == 7'h64) begin
      if (train_mispredicted & train_valid) begin
        BTB_100 <= train_pc;
      end else if (predict_valid) begin
        BTB_100 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_101 <= 7'h0;
    end else if (btb_index == 7'h65) begin
      if (train_mispredicted & train_valid) begin
        BTB_101 <= train_pc;
      end else if (predict_valid) begin
        BTB_101 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_102 <= 7'h0;
    end else if (btb_index == 7'h66) begin
      if (train_mispredicted & train_valid) begin
        BTB_102 <= train_pc;
      end else if (predict_valid) begin
        BTB_102 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_103 <= 7'h0;
    end else if (btb_index == 7'h67) begin
      if (train_mispredicted & train_valid) begin
        BTB_103 <= train_pc;
      end else if (predict_valid) begin
        BTB_103 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_104 <= 7'h0;
    end else if (btb_index == 7'h68) begin
      if (train_mispredicted & train_valid) begin
        BTB_104 <= train_pc;
      end else if (predict_valid) begin
        BTB_104 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_105 <= 7'h0;
    end else if (btb_index == 7'h69) begin
      if (train_mispredicted & train_valid) begin
        BTB_105 <= train_pc;
      end else if (predict_valid) begin
        BTB_105 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_106 <= 7'h0;
    end else if (btb_index == 7'h6a) begin
      if (train_mispredicted & train_valid) begin
        BTB_106 <= train_pc;
      end else if (predict_valid) begin
        BTB_106 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_107 <= 7'h0;
    end else if (btb_index == 7'h6b) begin
      if (train_mispredicted & train_valid) begin
        BTB_107 <= train_pc;
      end else if (predict_valid) begin
        BTB_107 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_108 <= 7'h0;
    end else if (btb_index == 7'h6c) begin
      if (train_mispredicted & train_valid) begin
        BTB_108 <= train_pc;
      end else if (predict_valid) begin
        BTB_108 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_109 <= 7'h0;
    end else if (btb_index == 7'h6d) begin
      if (train_mispredicted & train_valid) begin
        BTB_109 <= train_pc;
      end else if (predict_valid) begin
        BTB_109 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_110 <= 7'h0;
    end else if (btb_index == 7'h6e) begin
      if (train_mispredicted & train_valid) begin
        BTB_110 <= train_pc;
      end else if (predict_valid) begin
        BTB_110 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_111 <= 7'h0;
    end else if (btb_index == 7'h6f) begin
      if (train_mispredicted & train_valid) begin
        BTB_111 <= train_pc;
      end else if (predict_valid) begin
        BTB_111 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_112 <= 7'h0;
    end else if (btb_index == 7'h70) begin
      if (train_mispredicted & train_valid) begin
        BTB_112 <= train_pc;
      end else if (predict_valid) begin
        BTB_112 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_113 <= 7'h0;
    end else if (btb_index == 7'h71) begin
      if (train_mispredicted & train_valid) begin
        BTB_113 <= train_pc;
      end else if (predict_valid) begin
        BTB_113 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_114 <= 7'h0;
    end else if (btb_index == 7'h72) begin
      if (train_mispredicted & train_valid) begin
        BTB_114 <= train_pc;
      end else if (predict_valid) begin
        BTB_114 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_115 <= 7'h0;
    end else if (btb_index == 7'h73) begin
      if (train_mispredicted & train_valid) begin
        BTB_115 <= train_pc;
      end else if (predict_valid) begin
        BTB_115 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_116 <= 7'h0;
    end else if (btb_index == 7'h74) begin
      if (train_mispredicted & train_valid) begin
        BTB_116 <= train_pc;
      end else if (predict_valid) begin
        BTB_116 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_117 <= 7'h0;
    end else if (btb_index == 7'h75) begin
      if (train_mispredicted & train_valid) begin
        BTB_117 <= train_pc;
      end else if (predict_valid) begin
        BTB_117 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_118 <= 7'h0;
    end else if (btb_index == 7'h76) begin
      if (train_mispredicted & train_valid) begin
        BTB_118 <= train_pc;
      end else if (predict_valid) begin
        BTB_118 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_119 <= 7'h0;
    end else if (btb_index == 7'h77) begin
      if (train_mispredicted & train_valid) begin
        BTB_119 <= train_pc;
      end else if (predict_valid) begin
        BTB_119 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_120 <= 7'h0;
    end else if (btb_index == 7'h78) begin
      if (train_mispredicted & train_valid) begin
        BTB_120 <= train_pc;
      end else if (predict_valid) begin
        BTB_120 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_121 <= 7'h0;
    end else if (btb_index == 7'h79) begin
      if (train_mispredicted & train_valid) begin
        BTB_121 <= train_pc;
      end else if (predict_valid) begin
        BTB_121 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_122 <= 7'h0;
    end else if (btb_index == 7'h7a) begin
      if (train_mispredicted & train_valid) begin
        BTB_122 <= train_pc;
      end else if (predict_valid) begin
        BTB_122 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_123 <= 7'h0;
    end else if (btb_index == 7'h7b) begin
      if (train_mispredicted & train_valid) begin
        BTB_123 <= train_pc;
      end else if (predict_valid) begin
        BTB_123 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_124 <= 7'h0;
    end else if (btb_index == 7'h7c) begin
      if (train_mispredicted & train_valid) begin
        BTB_124 <= train_pc;
      end else if (predict_valid) begin
        BTB_124 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_125 <= 7'h0;
    end else if (btb_index == 7'h7d) begin
      if (train_mispredicted & train_valid) begin
        BTB_125 <= train_pc;
      end else if (predict_valid) begin
        BTB_125 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_126 <= 7'h0;
    end else if (btb_index == 7'h7e) begin
      if (train_mispredicted & train_valid) begin
        BTB_126 <= train_pc;
      end else if (predict_valid) begin
        BTB_126 <= predict_history;
      end
    end
  end
  always @(posedge clk or posedge areset) begin
    if (areset) begin
      BTB_127 <= 7'h0;
    end else if (btb_index == 7'h7f) begin
      if (train_mispredicted & train_valid) begin
        BTB_127 <= train_pc;
      end else if (predict_valid) begin
        BTB_127 <= predict_history;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  PHT_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  PHT_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  PHT_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  PHT_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  PHT_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  PHT_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  PHT_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  PHT_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  PHT_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  PHT_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  PHT_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  PHT_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  PHT_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  PHT_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  PHT_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  PHT_15 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  PHT_16 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  PHT_17 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  PHT_18 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  PHT_19 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  PHT_20 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  PHT_21 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  PHT_22 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  PHT_23 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  PHT_24 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  PHT_25 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  PHT_26 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  PHT_27 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  PHT_28 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  PHT_29 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  PHT_30 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  PHT_31 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  PHT_32 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  PHT_33 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  PHT_34 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  PHT_35 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  PHT_36 = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  PHT_37 = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  PHT_38 = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  PHT_39 = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  PHT_40 = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  PHT_41 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  PHT_42 = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  PHT_43 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  PHT_44 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  PHT_45 = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  PHT_46 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  PHT_47 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  PHT_48 = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  PHT_49 = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  PHT_50 = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  PHT_51 = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  PHT_52 = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  PHT_53 = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  PHT_54 = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  PHT_55 = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  PHT_56 = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  PHT_57 = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  PHT_58 = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  PHT_59 = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  PHT_60 = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  PHT_61 = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  PHT_62 = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  PHT_63 = _RAND_63[1:0];
  _RAND_64 = {1{`RANDOM}};
  PHT_64 = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  PHT_65 = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  PHT_66 = _RAND_66[1:0];
  _RAND_67 = {1{`RANDOM}};
  PHT_67 = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  PHT_68 = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  PHT_69 = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  PHT_70 = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  PHT_71 = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  PHT_72 = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  PHT_73 = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  PHT_74 = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  PHT_75 = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  PHT_76 = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  PHT_77 = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  PHT_78 = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  PHT_79 = _RAND_79[1:0];
  _RAND_80 = {1{`RANDOM}};
  PHT_80 = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  PHT_81 = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  PHT_82 = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  PHT_83 = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  PHT_84 = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  PHT_85 = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  PHT_86 = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  PHT_87 = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  PHT_88 = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  PHT_89 = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  PHT_90 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  PHT_91 = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  PHT_92 = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  PHT_93 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  PHT_94 = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  PHT_95 = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  PHT_96 = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  PHT_97 = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  PHT_98 = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  PHT_99 = _RAND_99[1:0];
  _RAND_100 = {1{`RANDOM}};
  PHT_100 = _RAND_100[1:0];
  _RAND_101 = {1{`RANDOM}};
  PHT_101 = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  PHT_102 = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  PHT_103 = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  PHT_104 = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  PHT_105 = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  PHT_106 = _RAND_106[1:0];
  _RAND_107 = {1{`RANDOM}};
  PHT_107 = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  PHT_108 = _RAND_108[1:0];
  _RAND_109 = {1{`RANDOM}};
  PHT_109 = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  PHT_110 = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  PHT_111 = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  PHT_112 = _RAND_112[1:0];
  _RAND_113 = {1{`RANDOM}};
  PHT_113 = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  PHT_114 = _RAND_114[1:0];
  _RAND_115 = {1{`RANDOM}};
  PHT_115 = _RAND_115[1:0];
  _RAND_116 = {1{`RANDOM}};
  PHT_116 = _RAND_116[1:0];
  _RAND_117 = {1{`RANDOM}};
  PHT_117 = _RAND_117[1:0];
  _RAND_118 = {1{`RANDOM}};
  PHT_118 = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  PHT_119 = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  PHT_120 = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  PHT_121 = _RAND_121[1:0];
  _RAND_122 = {1{`RANDOM}};
  PHT_122 = _RAND_122[1:0];
  _RAND_123 = {1{`RANDOM}};
  PHT_123 = _RAND_123[1:0];
  _RAND_124 = {1{`RANDOM}};
  PHT_124 = _RAND_124[1:0];
  _RAND_125 = {1{`RANDOM}};
  PHT_125 = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  PHT_126 = _RAND_126[1:0];
  _RAND_127 = {1{`RANDOM}};
  PHT_127 = _RAND_127[1:0];
  _RAND_128 = {1{`RANDOM}};
  BTB_0 = _RAND_128[6:0];
  _RAND_129 = {1{`RANDOM}};
  BTB_1 = _RAND_129[6:0];
  _RAND_130 = {1{`RANDOM}};
  BTB_2 = _RAND_130[6:0];
  _RAND_131 = {1{`RANDOM}};
  BTB_3 = _RAND_131[6:0];
  _RAND_132 = {1{`RANDOM}};
  BTB_4 = _RAND_132[6:0];
  _RAND_133 = {1{`RANDOM}};
  BTB_5 = _RAND_133[6:0];
  _RAND_134 = {1{`RANDOM}};
  BTB_6 = _RAND_134[6:0];
  _RAND_135 = {1{`RANDOM}};
  BTB_7 = _RAND_135[6:0];
  _RAND_136 = {1{`RANDOM}};
  BTB_8 = _RAND_136[6:0];
  _RAND_137 = {1{`RANDOM}};
  BTB_9 = _RAND_137[6:0];
  _RAND_138 = {1{`RANDOM}};
  BTB_10 = _RAND_138[6:0];
  _RAND_139 = {1{`RANDOM}};
  BTB_11 = _RAND_139[6:0];
  _RAND_140 = {1{`RANDOM}};
  BTB_12 = _RAND_140[6:0];
  _RAND_141 = {1{`RANDOM}};
  BTB_13 = _RAND_141[6:0];
  _RAND_142 = {1{`RANDOM}};
  BTB_14 = _RAND_142[6:0];
  _RAND_143 = {1{`RANDOM}};
  BTB_15 = _RAND_143[6:0];
  _RAND_144 = {1{`RANDOM}};
  BTB_16 = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  BTB_17 = _RAND_145[6:0];
  _RAND_146 = {1{`RANDOM}};
  BTB_18 = _RAND_146[6:0];
  _RAND_147 = {1{`RANDOM}};
  BTB_19 = _RAND_147[6:0];
  _RAND_148 = {1{`RANDOM}};
  BTB_20 = _RAND_148[6:0];
  _RAND_149 = {1{`RANDOM}};
  BTB_21 = _RAND_149[6:0];
  _RAND_150 = {1{`RANDOM}};
  BTB_22 = _RAND_150[6:0];
  _RAND_151 = {1{`RANDOM}};
  BTB_23 = _RAND_151[6:0];
  _RAND_152 = {1{`RANDOM}};
  BTB_24 = _RAND_152[6:0];
  _RAND_153 = {1{`RANDOM}};
  BTB_25 = _RAND_153[6:0];
  _RAND_154 = {1{`RANDOM}};
  BTB_26 = _RAND_154[6:0];
  _RAND_155 = {1{`RANDOM}};
  BTB_27 = _RAND_155[6:0];
  _RAND_156 = {1{`RANDOM}};
  BTB_28 = _RAND_156[6:0];
  _RAND_157 = {1{`RANDOM}};
  BTB_29 = _RAND_157[6:0];
  _RAND_158 = {1{`RANDOM}};
  BTB_30 = _RAND_158[6:0];
  _RAND_159 = {1{`RANDOM}};
  BTB_31 = _RAND_159[6:0];
  _RAND_160 = {1{`RANDOM}};
  BTB_32 = _RAND_160[6:0];
  _RAND_161 = {1{`RANDOM}};
  BTB_33 = _RAND_161[6:0];
  _RAND_162 = {1{`RANDOM}};
  BTB_34 = _RAND_162[6:0];
  _RAND_163 = {1{`RANDOM}};
  BTB_35 = _RAND_163[6:0];
  _RAND_164 = {1{`RANDOM}};
  BTB_36 = _RAND_164[6:0];
  _RAND_165 = {1{`RANDOM}};
  BTB_37 = _RAND_165[6:0];
  _RAND_166 = {1{`RANDOM}};
  BTB_38 = _RAND_166[6:0];
  _RAND_167 = {1{`RANDOM}};
  BTB_39 = _RAND_167[6:0];
  _RAND_168 = {1{`RANDOM}};
  BTB_40 = _RAND_168[6:0];
  _RAND_169 = {1{`RANDOM}};
  BTB_41 = _RAND_169[6:0];
  _RAND_170 = {1{`RANDOM}};
  BTB_42 = _RAND_170[6:0];
  _RAND_171 = {1{`RANDOM}};
  BTB_43 = _RAND_171[6:0];
  _RAND_172 = {1{`RANDOM}};
  BTB_44 = _RAND_172[6:0];
  _RAND_173 = {1{`RANDOM}};
  BTB_45 = _RAND_173[6:0];
  _RAND_174 = {1{`RANDOM}};
  BTB_46 = _RAND_174[6:0];
  _RAND_175 = {1{`RANDOM}};
  BTB_47 = _RAND_175[6:0];
  _RAND_176 = {1{`RANDOM}};
  BTB_48 = _RAND_176[6:0];
  _RAND_177 = {1{`RANDOM}};
  BTB_49 = _RAND_177[6:0];
  _RAND_178 = {1{`RANDOM}};
  BTB_50 = _RAND_178[6:0];
  _RAND_179 = {1{`RANDOM}};
  BTB_51 = _RAND_179[6:0];
  _RAND_180 = {1{`RANDOM}};
  BTB_52 = _RAND_180[6:0];
  _RAND_181 = {1{`RANDOM}};
  BTB_53 = _RAND_181[6:0];
  _RAND_182 = {1{`RANDOM}};
  BTB_54 = _RAND_182[6:0];
  _RAND_183 = {1{`RANDOM}};
  BTB_55 = _RAND_183[6:0];
  _RAND_184 = {1{`RANDOM}};
  BTB_56 = _RAND_184[6:0];
  _RAND_185 = {1{`RANDOM}};
  BTB_57 = _RAND_185[6:0];
  _RAND_186 = {1{`RANDOM}};
  BTB_58 = _RAND_186[6:0];
  _RAND_187 = {1{`RANDOM}};
  BTB_59 = _RAND_187[6:0];
  _RAND_188 = {1{`RANDOM}};
  BTB_60 = _RAND_188[6:0];
  _RAND_189 = {1{`RANDOM}};
  BTB_61 = _RAND_189[6:0];
  _RAND_190 = {1{`RANDOM}};
  BTB_62 = _RAND_190[6:0];
  _RAND_191 = {1{`RANDOM}};
  BTB_63 = _RAND_191[6:0];
  _RAND_192 = {1{`RANDOM}};
  BTB_64 = _RAND_192[6:0];
  _RAND_193 = {1{`RANDOM}};
  BTB_65 = _RAND_193[6:0];
  _RAND_194 = {1{`RANDOM}};
  BTB_66 = _RAND_194[6:0];
  _RAND_195 = {1{`RANDOM}};
  BTB_67 = _RAND_195[6:0];
  _RAND_196 = {1{`RANDOM}};
  BTB_68 = _RAND_196[6:0];
  _RAND_197 = {1{`RANDOM}};
  BTB_69 = _RAND_197[6:0];
  _RAND_198 = {1{`RANDOM}};
  BTB_70 = _RAND_198[6:0];
  _RAND_199 = {1{`RANDOM}};
  BTB_71 = _RAND_199[6:0];
  _RAND_200 = {1{`RANDOM}};
  BTB_72 = _RAND_200[6:0];
  _RAND_201 = {1{`RANDOM}};
  BTB_73 = _RAND_201[6:0];
  _RAND_202 = {1{`RANDOM}};
  BTB_74 = _RAND_202[6:0];
  _RAND_203 = {1{`RANDOM}};
  BTB_75 = _RAND_203[6:0];
  _RAND_204 = {1{`RANDOM}};
  BTB_76 = _RAND_204[6:0];
  _RAND_205 = {1{`RANDOM}};
  BTB_77 = _RAND_205[6:0];
  _RAND_206 = {1{`RANDOM}};
  BTB_78 = _RAND_206[6:0];
  _RAND_207 = {1{`RANDOM}};
  BTB_79 = _RAND_207[6:0];
  _RAND_208 = {1{`RANDOM}};
  BTB_80 = _RAND_208[6:0];
  _RAND_209 = {1{`RANDOM}};
  BTB_81 = _RAND_209[6:0];
  _RAND_210 = {1{`RANDOM}};
  BTB_82 = _RAND_210[6:0];
  _RAND_211 = {1{`RANDOM}};
  BTB_83 = _RAND_211[6:0];
  _RAND_212 = {1{`RANDOM}};
  BTB_84 = _RAND_212[6:0];
  _RAND_213 = {1{`RANDOM}};
  BTB_85 = _RAND_213[6:0];
  _RAND_214 = {1{`RANDOM}};
  BTB_86 = _RAND_214[6:0];
  _RAND_215 = {1{`RANDOM}};
  BTB_87 = _RAND_215[6:0];
  _RAND_216 = {1{`RANDOM}};
  BTB_88 = _RAND_216[6:0];
  _RAND_217 = {1{`RANDOM}};
  BTB_89 = _RAND_217[6:0];
  _RAND_218 = {1{`RANDOM}};
  BTB_90 = _RAND_218[6:0];
  _RAND_219 = {1{`RANDOM}};
  BTB_91 = _RAND_219[6:0];
  _RAND_220 = {1{`RANDOM}};
  BTB_92 = _RAND_220[6:0];
  _RAND_221 = {1{`RANDOM}};
  BTB_93 = _RAND_221[6:0];
  _RAND_222 = {1{`RANDOM}};
  BTB_94 = _RAND_222[6:0];
  _RAND_223 = {1{`RANDOM}};
  BTB_95 = _RAND_223[6:0];
  _RAND_224 = {1{`RANDOM}};
  BTB_96 = _RAND_224[6:0];
  _RAND_225 = {1{`RANDOM}};
  BTB_97 = _RAND_225[6:0];
  _RAND_226 = {1{`RANDOM}};
  BTB_98 = _RAND_226[6:0];
  _RAND_227 = {1{`RANDOM}};
  BTB_99 = _RAND_227[6:0];
  _RAND_228 = {1{`RANDOM}};
  BTB_100 = _RAND_228[6:0];
  _RAND_229 = {1{`RANDOM}};
  BTB_101 = _RAND_229[6:0];
  _RAND_230 = {1{`RANDOM}};
  BTB_102 = _RAND_230[6:0];
  _RAND_231 = {1{`RANDOM}};
  BTB_103 = _RAND_231[6:0];
  _RAND_232 = {1{`RANDOM}};
  BTB_104 = _RAND_232[6:0];
  _RAND_233 = {1{`RANDOM}};
  BTB_105 = _RAND_233[6:0];
  _RAND_234 = {1{`RANDOM}};
  BTB_106 = _RAND_234[6:0];
  _RAND_235 = {1{`RANDOM}};
  BTB_107 = _RAND_235[6:0];
  _RAND_236 = {1{`RANDOM}};
  BTB_108 = _RAND_236[6:0];
  _RAND_237 = {1{`RANDOM}};
  BTB_109 = _RAND_237[6:0];
  _RAND_238 = {1{`RANDOM}};
  BTB_110 = _RAND_238[6:0];
  _RAND_239 = {1{`RANDOM}};
  BTB_111 = _RAND_239[6:0];
  _RAND_240 = {1{`RANDOM}};
  BTB_112 = _RAND_240[6:0];
  _RAND_241 = {1{`RANDOM}};
  BTB_113 = _RAND_241[6:0];
  _RAND_242 = {1{`RANDOM}};
  BTB_114 = _RAND_242[6:0];
  _RAND_243 = {1{`RANDOM}};
  BTB_115 = _RAND_243[6:0];
  _RAND_244 = {1{`RANDOM}};
  BTB_116 = _RAND_244[6:0];
  _RAND_245 = {1{`RANDOM}};
  BTB_117 = _RAND_245[6:0];
  _RAND_246 = {1{`RANDOM}};
  BTB_118 = _RAND_246[6:0];
  _RAND_247 = {1{`RANDOM}};
  BTB_119 = _RAND_247[6:0];
  _RAND_248 = {1{`RANDOM}};
  BTB_120 = _RAND_248[6:0];
  _RAND_249 = {1{`RANDOM}};
  BTB_121 = _RAND_249[6:0];
  _RAND_250 = {1{`RANDOM}};
  BTB_122 = _RAND_250[6:0];
  _RAND_251 = {1{`RANDOM}};
  BTB_123 = _RAND_251[6:0];
  _RAND_252 = {1{`RANDOM}};
  BTB_124 = _RAND_252[6:0];
  _RAND_253 = {1{`RANDOM}};
  BTB_125 = _RAND_253[6:0];
  _RAND_254 = {1{`RANDOM}};
  BTB_126 = _RAND_254[6:0];
  _RAND_255 = {1{`RANDOM}};
  BTB_127 = _RAND_255[6:0];
`endif // RANDOMIZE_REG_INIT
  if (areset) begin
    PHT_0 = 2'h1;
  end
  if (areset) begin
    PHT_1 = 2'h1;
  end
  if (areset) begin
    PHT_2 = 2'h1;
  end
  if (areset) begin
    PHT_3 = 2'h1;
  end
  if (areset) begin
    PHT_4 = 2'h1;
  end
  if (areset) begin
    PHT_5 = 2'h1;
  end
  if (areset) begin
    PHT_6 = 2'h1;
  end
  if (areset) begin
    PHT_7 = 2'h1;
  end
  if (areset) begin
    PHT_8 = 2'h1;
  end
  if (areset) begin
    PHT_9 = 2'h1;
  end
  if (areset) begin
    PHT_10 = 2'h1;
  end
  if (areset) begin
    PHT_11 = 2'h1;
  end
  if (areset) begin
    PHT_12 = 2'h1;
  end
  if (areset) begin
    PHT_13 = 2'h1;
  end
  if (areset) begin
    PHT_14 = 2'h1;
  end
  if (areset) begin
    PHT_15 = 2'h1;
  end
  if (areset) begin
    PHT_16 = 2'h1;
  end
  if (areset) begin
    PHT_17 = 2'h1;
  end
  if (areset) begin
    PHT_18 = 2'h1;
  end
  if (areset) begin
    PHT_19 = 2'h1;
  end
  if (areset) begin
    PHT_20 = 2'h1;
  end
  if (areset) begin
    PHT_21 = 2'h1;
  end
  if (areset) begin
    PHT_22 = 2'h1;
  end
  if (areset) begin
    PHT_23 = 2'h1;
  end
  if (areset) begin
    PHT_24 = 2'h1;
  end
  if (areset) begin
    PHT_25 = 2'h1;
  end
  if (areset) begin
    PHT_26 = 2'h1;
  end
  if (areset) begin
    PHT_27 = 2'h1;
  end
  if (areset) begin
    PHT_28 = 2'h1;
  end
  if (areset) begin
    PHT_29 = 2'h1;
  end
  if (areset) begin
    PHT_30 = 2'h1;
  end
  if (areset) begin
    PHT_31 = 2'h1;
  end
  if (areset) begin
    PHT_32 = 2'h1;
  end
  if (areset) begin
    PHT_33 = 2'h1;
  end
  if (areset) begin
    PHT_34 = 2'h1;
  end
  if (areset) begin
    PHT_35 = 2'h1;
  end
  if (areset) begin
    PHT_36 = 2'h1;
  end
  if (areset) begin
    PHT_37 = 2'h1;
  end
  if (areset) begin
    PHT_38 = 2'h1;
  end
  if (areset) begin
    PHT_39 = 2'h1;
  end
  if (areset) begin
    PHT_40 = 2'h1;
  end
  if (areset) begin
    PHT_41 = 2'h1;
  end
  if (areset) begin
    PHT_42 = 2'h1;
  end
  if (areset) begin
    PHT_43 = 2'h1;
  end
  if (areset) begin
    PHT_44 = 2'h1;
  end
  if (areset) begin
    PHT_45 = 2'h1;
  end
  if (areset) begin
    PHT_46 = 2'h1;
  end
  if (areset) begin
    PHT_47 = 2'h1;
  end
  if (areset) begin
    PHT_48 = 2'h1;
  end
  if (areset) begin
    PHT_49 = 2'h1;
  end
  if (areset) begin
    PHT_50 = 2'h1;
  end
  if (areset) begin
    PHT_51 = 2'h1;
  end
  if (areset) begin
    PHT_52 = 2'h1;
  end
  if (areset) begin
    PHT_53 = 2'h1;
  end
  if (areset) begin
    PHT_54 = 2'h1;
  end
  if (areset) begin
    PHT_55 = 2'h1;
  end
  if (areset) begin
    PHT_56 = 2'h1;
  end
  if (areset) begin
    PHT_57 = 2'h1;
  end
  if (areset) begin
    PHT_58 = 2'h1;
  end
  if (areset) begin
    PHT_59 = 2'h1;
  end
  if (areset) begin
    PHT_60 = 2'h1;
  end
  if (areset) begin
    PHT_61 = 2'h1;
  end
  if (areset) begin
    PHT_62 = 2'h1;
  end
  if (areset) begin
    PHT_63 = 2'h1;
  end
  if (areset) begin
    PHT_64 = 2'h1;
  end
  if (areset) begin
    PHT_65 = 2'h1;
  end
  if (areset) begin
    PHT_66 = 2'h1;
  end
  if (areset) begin
    PHT_67 = 2'h1;
  end
  if (areset) begin
    PHT_68 = 2'h1;
  end
  if (areset) begin
    PHT_69 = 2'h1;
  end
  if (areset) begin
    PHT_70 = 2'h1;
  end
  if (areset) begin
    PHT_71 = 2'h1;
  end
  if (areset) begin
    PHT_72 = 2'h1;
  end
  if (areset) begin
    PHT_73 = 2'h1;
  end
  if (areset) begin
    PHT_74 = 2'h1;
  end
  if (areset) begin
    PHT_75 = 2'h1;
  end
  if (areset) begin
    PHT_76 = 2'h1;
  end
  if (areset) begin
    PHT_77 = 2'h1;
  end
  if (areset) begin
    PHT_78 = 2'h1;
  end
  if (areset) begin
    PHT_79 = 2'h1;
  end
  if (areset) begin
    PHT_80 = 2'h1;
  end
  if (areset) begin
    PHT_81 = 2'h1;
  end
  if (areset) begin
    PHT_82 = 2'h1;
  end
  if (areset) begin
    PHT_83 = 2'h1;
  end
  if (areset) begin
    PHT_84 = 2'h1;
  end
  if (areset) begin
    PHT_85 = 2'h1;
  end
  if (areset) begin
    PHT_86 = 2'h1;
  end
  if (areset) begin
    PHT_87 = 2'h1;
  end
  if (areset) begin
    PHT_88 = 2'h1;
  end
  if (areset) begin
    PHT_89 = 2'h1;
  end
  if (areset) begin
    PHT_90 = 2'h1;
  end
  if (areset) begin
    PHT_91 = 2'h1;
  end
  if (areset) begin
    PHT_92 = 2'h1;
  end
  if (areset) begin
    PHT_93 = 2'h1;
  end
  if (areset) begin
    PHT_94 = 2'h1;
  end
  if (areset) begin
    PHT_95 = 2'h1;
  end
  if (areset) begin
    PHT_96 = 2'h1;
  end
  if (areset) begin
    PHT_97 = 2'h1;
  end
  if (areset) begin
    PHT_98 = 2'h1;
  end
  if (areset) begin
    PHT_99 = 2'h1;
  end
  if (areset) begin
    PHT_100 = 2'h1;
  end
  if (areset) begin
    PHT_101 = 2'h1;
  end
  if (areset) begin
    PHT_102 = 2'h1;
  end
  if (areset) begin
    PHT_103 = 2'h1;
  end
  if (areset) begin
    PHT_104 = 2'h1;
  end
  if (areset) begin
    PHT_105 = 2'h1;
  end
  if (areset) begin
    PHT_106 = 2'h1;
  end
  if (areset) begin
    PHT_107 = 2'h1;
  end
  if (areset) begin
    PHT_108 = 2'h1;
  end
  if (areset) begin
    PHT_109 = 2'h1;
  end
  if (areset) begin
    PHT_110 = 2'h1;
  end
  if (areset) begin
    PHT_111 = 2'h1;
  end
  if (areset) begin
    PHT_112 = 2'h1;
  end
  if (areset) begin
    PHT_113 = 2'h1;
  end
  if (areset) begin
    PHT_114 = 2'h1;
  end
  if (areset) begin
    PHT_115 = 2'h1;
  end
  if (areset) begin
    PHT_116 = 2'h1;
  end
  if (areset) begin
    PHT_117 = 2'h1;
  end
  if (areset) begin
    PHT_118 = 2'h1;
  end
  if (areset) begin
    PHT_119 = 2'h1;
  end
  if (areset) begin
    PHT_120 = 2'h1;
  end
  if (areset) begin
    PHT_121 = 2'h1;
  end
  if (areset) begin
    PHT_122 = 2'h1;
  end
  if (areset) begin
    PHT_123 = 2'h1;
  end
  if (areset) begin
    PHT_124 = 2'h1;
  end
  if (areset) begin
    PHT_125 = 2'h1;
  end
  if (areset) begin
    PHT_126 = 2'h1;
  end
  if (areset) begin
    PHT_127 = 2'h1;
  end
  if (areset) begin
    BTB_0 = 7'h0;
  end
  if (areset) begin
    BTB_1 = 7'h0;
  end
  if (areset) begin
    BTB_2 = 7'h0;
  end
  if (areset) begin
    BTB_3 = 7'h0;
  end
  if (areset) begin
    BTB_4 = 7'h0;
  end
  if (areset) begin
    BTB_5 = 7'h0;
  end
  if (areset) begin
    BTB_6 = 7'h0;
  end
  if (areset) begin
    BTB_7 = 7'h0;
  end
  if (areset) begin
    BTB_8 = 7'h0;
  end
  if (areset) begin
    BTB_9 = 7'h0;
  end
  if (areset) begin
    BTB_10 = 7'h0;
  end
  if (areset) begin
    BTB_11 = 7'h0;
  end
  if (areset) begin
    BTB_12 = 7'h0;
  end
  if (areset) begin
    BTB_13 = 7'h0;
  end
  if (areset) begin
    BTB_14 = 7'h0;
  end
  if (areset) begin
    BTB_15 = 7'h0;
  end
  if (areset) begin
    BTB_16 = 7'h0;
  end
  if (areset) begin
    BTB_17 = 7'h0;
  end
  if (areset) begin
    BTB_18 = 7'h0;
  end
  if (areset) begin
    BTB_19 = 7'h0;
  end
  if (areset) begin
    BTB_20 = 7'h0;
  end
  if (areset) begin
    BTB_21 = 7'h0;
  end
  if (areset) begin
    BTB_22 = 7'h0;
  end
  if (areset) begin
    BTB_23 = 7'h0;
  end
  if (areset) begin
    BTB_24 = 7'h0;
  end
  if (areset) begin
    BTB_25 = 7'h0;
  end
  if (areset) begin
    BTB_26 = 7'h0;
  end
  if (areset) begin
    BTB_27 = 7'h0;
  end
  if (areset) begin
    BTB_28 = 7'h0;
  end
  if (areset) begin
    BTB_29 = 7'h0;
  end
  if (areset) begin
    BTB_30 = 7'h0;
  end
  if (areset) begin
    BTB_31 = 7'h0;
  end
  if (areset) begin
    BTB_32 = 7'h0;
  end
  if (areset) begin
    BTB_33 = 7'h0;
  end
  if (areset) begin
    BTB_34 = 7'h0;
  end
  if (areset) begin
    BTB_35 = 7'h0;
  end
  if (areset) begin
    BTB_36 = 7'h0;
  end
  if (areset) begin
    BTB_37 = 7'h0;
  end
  if (areset) begin
    BTB_38 = 7'h0;
  end
  if (areset) begin
    BTB_39 = 7'h0;
  end
  if (areset) begin
    BTB_40 = 7'h0;
  end
  if (areset) begin
    BTB_41 = 7'h0;
  end
  if (areset) begin
    BTB_42 = 7'h0;
  end
  if (areset) begin
    BTB_43 = 7'h0;
  end
  if (areset) begin
    BTB_44 = 7'h0;
  end
  if (areset) begin
    BTB_45 = 7'h0;
  end
  if (areset) begin
    BTB_46 = 7'h0;
  end
  if (areset) begin
    BTB_47 = 7'h0;
  end
  if (areset) begin
    BTB_48 = 7'h0;
  end
  if (areset) begin
    BTB_49 = 7'h0;
  end
  if (areset) begin
    BTB_50 = 7'h0;
  end
  if (areset) begin
    BTB_51 = 7'h0;
  end
  if (areset) begin
    BTB_52 = 7'h0;
  end
  if (areset) begin
    BTB_53 = 7'h0;
  end
  if (areset) begin
    BTB_54 = 7'h0;
  end
  if (areset) begin
    BTB_55 = 7'h0;
  end
  if (areset) begin
    BTB_56 = 7'h0;
  end
  if (areset) begin
    BTB_57 = 7'h0;
  end
  if (areset) begin
    BTB_58 = 7'h0;
  end
  if (areset) begin
    BTB_59 = 7'h0;
  end
  if (areset) begin
    BTB_60 = 7'h0;
  end
  if (areset) begin
    BTB_61 = 7'h0;
  end
  if (areset) begin
    BTB_62 = 7'h0;
  end
  if (areset) begin
    BTB_63 = 7'h0;
  end
  if (areset) begin
    BTB_64 = 7'h0;
  end
  if (areset) begin
    BTB_65 = 7'h0;
  end
  if (areset) begin
    BTB_66 = 7'h0;
  end
  if (areset) begin
    BTB_67 = 7'h0;
  end
  if (areset) begin
    BTB_68 = 7'h0;
  end
  if (areset) begin
    BTB_69 = 7'h0;
  end
  if (areset) begin
    BTB_70 = 7'h0;
  end
  if (areset) begin
    BTB_71 = 7'h0;
  end
  if (areset) begin
    BTB_72 = 7'h0;
  end
  if (areset) begin
    BTB_73 = 7'h0;
  end
  if (areset) begin
    BTB_74 = 7'h0;
  end
  if (areset) begin
    BTB_75 = 7'h0;
  end
  if (areset) begin
    BTB_76 = 7'h0;
  end
  if (areset) begin
    BTB_77 = 7'h0;
  end
  if (areset) begin
    BTB_78 = 7'h0;
  end
  if (areset) begin
    BTB_79 = 7'h0;
  end
  if (areset) begin
    BTB_80 = 7'h0;
  end
  if (areset) begin
    BTB_81 = 7'h0;
  end
  if (areset) begin
    BTB_82 = 7'h0;
  end
  if (areset) begin
    BTB_83 = 7'h0;
  end
  if (areset) begin
    BTB_84 = 7'h0;
  end
  if (areset) begin
    BTB_85 = 7'h0;
  end
  if (areset) begin
    BTB_86 = 7'h0;
  end
  if (areset) begin
    BTB_87 = 7'h0;
  end
  if (areset) begin
    BTB_88 = 7'h0;
  end
  if (areset) begin
    BTB_89 = 7'h0;
  end
  if (areset) begin
    BTB_90 = 7'h0;
  end
  if (areset) begin
    BTB_91 = 7'h0;
  end
  if (areset) begin
    BTB_92 = 7'h0;
  end
  if (areset) begin
    BTB_93 = 7'h0;
  end
  if (areset) begin
    BTB_94 = 7'h0;
  end
  if (areset) begin
    BTB_95 = 7'h0;
  end
  if (areset) begin
    BTB_96 = 7'h0;
  end
  if (areset) begin
    BTB_97 = 7'h0;
  end
  if (areset) begin
    BTB_98 = 7'h0;
  end
  if (areset) begin
    BTB_99 = 7'h0;
  end
  if (areset) begin
    BTB_100 = 7'h0;
  end
  if (areset) begin
    BTB_101 = 7'h0;
  end
  if (areset) begin
    BTB_102 = 7'h0;
  end
  if (areset) begin
    BTB_103 = 7'h0;
  end
  if (areset) begin
    BTB_104 = 7'h0;
  end
  if (areset) begin
    BTB_105 = 7'h0;
  end
  if (areset) begin
    BTB_106 = 7'h0;
  end
  if (areset) begin
    BTB_107 = 7'h0;
  end
  if (areset) begin
    BTB_108 = 7'h0;
  end
  if (areset) begin
    BTB_109 = 7'h0;
  end
  if (areset) begin
    BTB_110 = 7'h0;
  end
  if (areset) begin
    BTB_111 = 7'h0;
  end
  if (areset) begin
    BTB_112 = 7'h0;
  end
  if (areset) begin
    BTB_113 = 7'h0;
  end
  if (areset) begin
    BTB_114 = 7'h0;
  end
  if (areset) begin
    BTB_115 = 7'h0;
  end
  if (areset) begin
    BTB_116 = 7'h0;
  end
  if (areset) begin
    BTB_117 = 7'h0;
  end
  if (areset) begin
    BTB_118 = 7'h0;
  end
  if (areset) begin
    BTB_119 = 7'h0;
  end
  if (areset) begin
    BTB_120 = 7'h0;
  end
  if (areset) begin
    BTB_121 = 7'h0;
  end
  if (areset) begin
    BTB_122 = 7'h0;
  end
  if (areset) begin
    BTB_123 = 7'h0;
  end
  if (areset) begin
    BTB_124 = 7'h0;
  end
  if (areset) begin
    BTB_125 = 7'h0;
  end
  if (areset) begin
    BTB_126 = 7'h0;
  end
  if (areset) begin
    BTB_127 = 7'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
