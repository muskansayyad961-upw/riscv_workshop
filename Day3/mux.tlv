\m5_TLV_version 1d: tl-x.org
\m5

\SV
   // Macro providing required top-level module definition,
   // random stimulus support, and Verilator config.
   m5_makerchip_module

\TLV
   // Connect SV inputs to TLV pipesignals.
   $reset = *reset;

   // 2:1 Multiplexer
   $out = $sel ? $in1 : $in2;

   // End simulation after 40 cycles
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;

\SV
   endmodule
