// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/17.0std/ip/merlin/altera_merlin_std_arbitrator/altera_merlin_std_arbitrator.sv.terp#1 $
// $Revision: #1 $
// $Date: 2017/01/22 $
// $Author: swbranch $

// ------------------------------------------------------------
// Wrapper for the standard arbitrator
//
// Provides a Merlin arbitrator API around the standard arb
// implementation.
// ------------------------------------------------------------

`timescale 1 ns / 1 ns
// ------------------------------------------
// Generation parameters:
//   output_name:         nios2_tristate_conduit_pin_sharer_arbiter
//   NUM_REQUESTERS:      1
//   SCHEME:              "round-robin"
//   ST_DATA_W:           8
//   ST_CHANNEL_W:        1
// ------------------------------------------

module nios2_tristate_conduit_pin_sharer_arbiter
(
    // --------------------------------------
    // Request sinks
    // --------------------------------------
    input                       sink0_valid,

    // --------------------------------------
    // Clock/reset
    // --------------------------------------
    input clk,
    input reset,
   
    // --------------------------------------
    // Grant source
    // --------------------------------------
    output [1-1:0] next_grant,    // st source data
    input                       ack            // st source ready
);

    localparam NUM_REQUESTERS = 1;
    localparam SCHEME         = "round-robin";
    localparam ST_DATA_W      = 8;
    localparam ST_CHANNEL_W   = 1;
    // --------------------------------------
    // Signals
    // --------------------------------------
    wire [NUM_REQUESTERS-1:0]   request;

    assign request[0] = sink0_valid;

    altera_merlin_std_arbitrator_core
    #(
        .NUM_REQUESTERS(NUM_REQUESTERS),
        .SCHEME        (SCHEME)
    ) 
    arb (
        .request    (request),
        .next_grant (next_grant),
        .ack        (ack),

        .clk        (clk),
        .reset      (reset)
    );

endmodule


