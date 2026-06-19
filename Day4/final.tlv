|cpu
@0
$reset = *reset;

```
  // PC Logic
  $pc[31:0] =
     >>1$reset ? 32'd0 :
     >>1$taken_br ? >>1$br_tgt_pc :
                    >>1$pc + 32'd4;
```

@1
// Pass condition
*passed = |cpu/xreg[10]>>5$value == (1+2+3+4+5+6+7+8+9);

```
  // Instruction Fetch
  $imem_rd_addr[M4_IMEM_INDEX_CNT - 1:0] = $pc[M4_IMEM_INDEX_CNT + 1:2];
  $imem_rd_en = !$reset;
  $instr[31:0] = $imem_rd_data[31:0];

  // Register File Read
  $rf_rd_en1 = $rs1_valid;
  $rf_rd_index1[4:0] = $rs1;

  $rf_rd_en2 = $rs2_valid;
  $rf_rd_index2[4:0] = $rs2;

  // Source values
  $src1_value[31:0] = $rf_rd_data1;
  $src2_value[31:0] = $rf_rd_data2;

  // ALU
  $result[31:0] =
     $is_add  ? ($src1_value + $src2_value) :
     $is_addi ? ($src1_value + $imm) :
     32'bx;

  // Branch target
  $br_tgt_pc[31:0] = $pc + $imm;

  // Branch conditions
  $taken_br =
     $is_beq  ? ($src1_value == $src2_value) :
     $is_bne  ? ($src1_value != $src2_value) :
     $is_blt  ? (($src1_value < $src2_value) ^ ($src1_value[31] != $src2_value[31])) :
     $is_bge  ? (($src1_value >= $src2_value) ^ ($src1_value[31] != $src2_value[31])) :
     $is_bltu ? ($src1_value < $src2_value) :
     $is_bgeu ? ($src1_value >= $src2_value) :
     1'b0;

  // Register File Write
  $rf_wr_en = $rd_valid && ($rd != 5'b00000);
  $rf_wr_index[4:0] = $rd;
  $rf_wr_data[31:0] = $result;
```

*failed = 1'b0;

|cpu
m4+imem(@1)
m4+rf(@1, @1)
//m4+dmem(@4)

m4+cpu_viz(@4)
