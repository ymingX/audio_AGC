	component nios2 is
		port (
			clk_clk                                                : in    std_logic                     := 'X';             -- clk
			flash_generic_tristate_controller_tcm_write_n_out      : out   std_logic_vector(0 downto 0);                     -- generic_tristate_controller_tcm_write_n_out
			flash_generic_tristate_controller_tcm_chipselect_n_out : out   std_logic_vector(0 downto 0);                     -- generic_tristate_controller_tcm_chipselect_n_out
			flash_generic_tristate_controller_tcm_read_n_out       : out   std_logic_vector(0 downto 0);                     -- generic_tristate_controller_tcm_read_n_out
			flash_generic_tristate_controller_tcm_data_out         : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- generic_tristate_controller_tcm_data_out
			flash_generic_tristate_controller_tcm_address_out      : out   std_logic_vector(21 downto 0);                    -- generic_tristate_controller_tcm_address_out
			fmeasure_clk_export                                    : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			fmeasure_sqr_export                                    : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			keyirq_export                                          : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			keyvalue_export                                        : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			lcd_lcd_cs_n                                           : out   std_logic;                                        -- lcd_cs_n
			lcd_lcd_wr_n                                           : out   std_logic;                                        -- lcd_wr_n
			lcd_lcd_rd_n                                           : out   std_logic;                                        -- lcd_rd_n
			lcd_lcd_rs                                             : out   std_logic;                                        -- lcd_rs
			lcd_lcd_data                                           : inout std_logic_vector(15 downto 0) := (others => 'X'); -- lcd_data
			reset_reset_n                                          : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                                             : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_ba                                               : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                                            : out   std_logic;                                        -- cas_n
			sdram_cke                                              : out   std_logic;                                        -- cke
			sdram_cs_n                                             : out   std_logic;                                        -- cs_n
			sdram_dq                                               : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm                                              : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n                                            : out   std_logic;                                        -- ras_n
			sdram_we_n                                             : out   std_logic;                                        -- we_n
			touch_irq_export                                       : in    std_logic                     := 'X';             -- export
			touch_scl_export                                       : out   std_logic;                                        -- export
			touch_sda_export                                       : inout std_logic                     := 'X';             -- export
			tas_sda_export                                         : inout std_logic                     := 'X';             -- export
			tas_scl_export                                         : out   std_logic                                         -- export
		);
	end component nios2;

	u0 : component nios2
		port map (
			clk_clk                                                => CONNECTED_TO_clk_clk,                                                --          clk.clk
			flash_generic_tristate_controller_tcm_write_n_out      => CONNECTED_TO_flash_generic_tristate_controller_tcm_write_n_out,      --        flash.generic_tristate_controller_tcm_write_n_out
			flash_generic_tristate_controller_tcm_chipselect_n_out => CONNECTED_TO_flash_generic_tristate_controller_tcm_chipselect_n_out, --             .generic_tristate_controller_tcm_chipselect_n_out
			flash_generic_tristate_controller_tcm_read_n_out       => CONNECTED_TO_flash_generic_tristate_controller_tcm_read_n_out,       --             .generic_tristate_controller_tcm_read_n_out
			flash_generic_tristate_controller_tcm_data_out         => CONNECTED_TO_flash_generic_tristate_controller_tcm_data_out,         --             .generic_tristate_controller_tcm_data_out
			flash_generic_tristate_controller_tcm_address_out      => CONNECTED_TO_flash_generic_tristate_controller_tcm_address_out,      --             .generic_tristate_controller_tcm_address_out
			fmeasure_clk_export                                    => CONNECTED_TO_fmeasure_clk_export,                                    -- fmeasure_clk.export
			fmeasure_sqr_export                                    => CONNECTED_TO_fmeasure_sqr_export,                                    -- fmeasure_sqr.export
			keyirq_export                                          => CONNECTED_TO_keyirq_export,                                          --       keyirq.export
			keyvalue_export                                        => CONNECTED_TO_keyvalue_export,                                        --     keyvalue.export
			lcd_lcd_cs_n                                           => CONNECTED_TO_lcd_lcd_cs_n,                                           --          lcd.lcd_cs_n
			lcd_lcd_wr_n                                           => CONNECTED_TO_lcd_lcd_wr_n,                                           --             .lcd_wr_n
			lcd_lcd_rd_n                                           => CONNECTED_TO_lcd_lcd_rd_n,                                           --             .lcd_rd_n
			lcd_lcd_rs                                             => CONNECTED_TO_lcd_lcd_rs,                                             --             .lcd_rs
			lcd_lcd_data                                           => CONNECTED_TO_lcd_lcd_data,                                           --             .lcd_data
			reset_reset_n                                          => CONNECTED_TO_reset_reset_n,                                          --        reset.reset_n
			sdram_addr                                             => CONNECTED_TO_sdram_addr,                                             --        sdram.addr
			sdram_ba                                               => CONNECTED_TO_sdram_ba,                                               --             .ba
			sdram_cas_n                                            => CONNECTED_TO_sdram_cas_n,                                            --             .cas_n
			sdram_cke                                              => CONNECTED_TO_sdram_cke,                                              --             .cke
			sdram_cs_n                                             => CONNECTED_TO_sdram_cs_n,                                             --             .cs_n
			sdram_dq                                               => CONNECTED_TO_sdram_dq,                                               --             .dq
			sdram_dqm                                              => CONNECTED_TO_sdram_dqm,                                              --             .dqm
			sdram_ras_n                                            => CONNECTED_TO_sdram_ras_n,                                            --             .ras_n
			sdram_we_n                                             => CONNECTED_TO_sdram_we_n,                                             --             .we_n
			touch_irq_export                                       => CONNECTED_TO_touch_irq_export,                                       --    touch_irq.export
			touch_scl_export                                       => CONNECTED_TO_touch_scl_export,                                       --    touch_scl.export
			touch_sda_export                                       => CONNECTED_TO_touch_sda_export,                                       --    touch_sda.export
			tas_sda_export                                         => CONNECTED_TO_tas_sda_export,                                         --      tas_sda.export
			tas_scl_export                                         => CONNECTED_TO_tas_scl_export                                          --      tas_scl.export
		);

