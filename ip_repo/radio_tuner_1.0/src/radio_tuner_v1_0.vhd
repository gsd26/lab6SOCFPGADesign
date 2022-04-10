library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity radio_tuner_v1_0 is
    generic (
        -- Users to add parameters here

        -- User parameters ends
        -- Do not modify the parameters beyond this line


        -- Parameters of Axi Slave Bus Interface S00_AXI
        C_S00_AXI_DATA_WIDTH	: integer	:= 32;
        C_S00_AXI_ADDR_WIDTH	: integer	:= 4;

        -- Parameters of Axi Master Bus Interface M00_AXIS
        C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
        C_M00_AXIS_START_COUNT	: integer	:= 32
    );
    port (
        -- Users to add ports here

        -- User ports ends
        -- Do not modify the ports beyond this line


        -- Ports of Axi Slave Bus Interface S00_AXI
        s00_axi_aclk	: in std_logic;
        s00_axi_aresetn	: in std_logic;
        s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_awprot	: in std_logic_vector(2 downto 0);
        s00_axi_awvalid	: in std_logic;
        s00_axi_awready	: out std_logic;
        s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
        s00_axi_wvalid	: in std_logic;
        s00_axi_wready	: out std_logic;
        s00_axi_bresp	: out std_logic_vector(1 downto 0);
        s00_axi_bvalid	: out std_logic;
        s00_axi_bready	: in std_logic;
        s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
        s00_axi_arprot	: in std_logic_vector(2 downto 0);
        s00_axi_arvalid	: in std_logic;
        s00_axi_arready	: out std_logic;
        s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        s00_axi_rresp	: out std_logic_vector(1 downto 0);
        s00_axi_rvalid	: out std_logic;
        s00_axi_rready	: in std_logic;

        -- Ports of Axi Master Bus Interface M00_AXIS
        m00_axis_aclk	: in std_logic;
        m00_axis_aresetn	: in std_logic;
        m00_axis_tvalid	: out std_logic;
        m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
        m00_axis_tstrb	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
        m00_axis_tlast	: out std_logic;
        m00_axis_tready	: in std_logic
    );
end radio_tuner_v1_0;

architecture arch_imp of radio_tuner_v1_0 is

    -- component declaration
    component radio_tuner_v1_0_S00_AXI is
        generic (
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_AXI_ADDR_WIDTH	: integer	:= 4
        );
        port (

            adcPhaseIncrement: out std_logic_vector(31 downto 0);
            tunerPhaseIncrement: out std_logic_vector(31 downto 0);
            syncReset: out std_logic;

            S_AXI_ACLK	: in std_logic;
            S_AXI_ARESETN	: in std_logic;
            S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
            S_AXI_AWVALID	: in std_logic;
            S_AXI_AWREADY	: out std_logic;
            S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID	: in std_logic;
            S_AXI_WREADY	: out std_logic;
            S_AXI_BRESP	: out std_logic_vector(1 downto 0);
            S_AXI_BVALID	: out std_logic;
            S_AXI_BREADY	: in std_logic;
            S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
            S_AXI_ARVALID	: in std_logic;
            S_AXI_ARREADY	: out std_logic;
            S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP	: out std_logic_vector(1 downto 0);
            S_AXI_RVALID	: out std_logic;
            S_AXI_RREADY	: in std_logic
        );
    end component radio_tuner_v1_0_S00_AXI;

    component radio_tuner_v1_0_M00_AXIS is
        generic (
            C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
            C_M_START_COUNT	: integer	:= 32
        );
        port (
            M_AXIS_ACLK	: in std_logic;
            M_AXIS_ARESETN	: in std_logic;
            M_AXIS_TVALID	: out std_logic;
            M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
            M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
            M_AXIS_TLAST	: out std_logic;
            M_AXIS_TREADY	: in std_logic
        );
    end component radio_tuner_v1_0_M00_AXIS;


    --MORE USER COMPONENTS


    COMPONENT dds_compiler_0
        PORT (
            aclk : IN STD_LOGIC;
            aresetn : IN STD_LOGIC;
            s_axis_phase_tvalid : IN STD_LOGIC;
            s_axis_phase_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            m_axis_data_tvalid : OUT STD_LOGIC;
            m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;


    COMPONENT fir_filter_stage_2
        PORT (
            aresetn : IN STD_LOGIC;
            aclk : IN STD_LOGIC;
            s_axis_data_tvalid : IN STD_LOGIC;
            s_axis_data_tready : OUT STD_LOGIC;
            s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            m_axis_data_tvalid : OUT STD_LOGIC;
            m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
        );
    END COMPONENT;


    COMPONENT fir_filter_stage_1
        PORT (
            aresetn : IN STD_LOGIC;

            aclk : IN STD_LOGIC;
            s_axis_data_tvalid : IN STD_LOGIC;
            s_axis_data_tready : OUT STD_LOGIC;
            s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            m_axis_data_tvalid : OUT STD_LOGIC;
            m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
        );
    END COMPONENT;


    COMPONENT sineMultiplier is
        Port ( sineDataTuner : in STD_LOGIC_VECTOR (31 downto 0);
             sineDataAdc : in STD_LOGIC_VECTOR (15 downto 0);
             sineMultipleOutReal : out STD_LOGIC_VECTOR (31 downto 0);
             sineMultipleOutImag : out STD_LOGIC_VECTOR (31 downto 0)

            );
    end COMPONENT;
    COMPONENT ila_0

        PORT (
            clk : IN STD_LOGIC;



            probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)

        );
    END COMPONENT  ;

    --User signals 

    signal filter1Real_Valid,filter2Real_Valid, filter1Imag_Valid,filter2Imag_Valid: std_logic;

    signal SineDataADC,mixedADCRealFilter1,mixedADCRealFilter2,mixedADCImagFilter1,mixedADCImagFilter2: std_logic_vector( 15 downto 0);

    signal tunerSineCosineOut,dds_ADC_out,mixedADCReal,mixedADCImag: std_logic_vector(31 downto 0);

    signal syncReset: std_logic;

    signal tunerPhaseIncrement,adcPhaseIncrement: std_logic_vector(31 downto 0);

    signal filter1dataReal,filter2dataReal,filter1dataImag,filter2dataImag: std_logic_vector(39 downto 0);
begin
    -- Instantiation of Axi Bus Interface S00_AXI
    radio_tuner_v1_0_S00_AXI_inst : radio_tuner_v1_0_S00_AXI
        generic map (
            C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
            C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
        )
        port map (
            adcPhaseIncrement => adcPhaseIncrement,
            tunerPhaseIncrement=>tunerPhaseIncrement,
            syncReset=>syncReset,
            S_AXI_ACLK	=> s00_axi_aclk,
            S_AXI_ARESETN	=> s00_axi_aresetn,
            S_AXI_AWADDR	=> s00_axi_awaddr,
            S_AXI_AWPROT	=> s00_axi_awprot,
            S_AXI_AWVALID	=> s00_axi_awvalid,
            S_AXI_AWREADY	=> s00_axi_awready,
            S_AXI_WDATA	=> s00_axi_wdata,
            S_AXI_WSTRB	=> s00_axi_wstrb,
            S_AXI_WVALID	=> s00_axi_wvalid,
            S_AXI_WREADY	=> s00_axi_wready,
            S_AXI_BRESP	=> s00_axi_bresp,
            S_AXI_BVALID	=> s00_axi_bvalid,
            S_AXI_BREADY	=> s00_axi_bready,
            S_AXI_ARADDR	=> s00_axi_araddr,
            S_AXI_ARPROT	=> s00_axi_arprot,
            S_AXI_ARVALID	=> s00_axi_arvalid,
            S_AXI_ARREADY	=> s00_axi_arready,
            S_AXI_RDATA	=> s00_axi_rdata,
            S_AXI_RRESP	=> s00_axi_rresp,
            S_AXI_RVALID	=> s00_axi_rvalid,
            S_AXI_RREADY	=> s00_axi_rready
        );

    -- Instantiation of Axi Bus Interface M00_AXIS 
    --This peripheral isn't really used because the output stage of this peripheral is already AXI stream
    radio_tuner_v1_0_M00_AXIS_inst : radio_tuner_v1_0_M00_AXIS
        generic map (
            C_M_AXIS_TDATA_WIDTH	=> C_M00_AXIS_TDATA_WIDTH,
            C_M_START_COUNT	=> C_M00_AXIS_START_COUNT
        )
        port map (
            M_AXIS_ACLK	=> m00_axis_aclk,
            M_AXIS_ARESETN	=> m00_axis_aresetn,
            M_AXIS_TVALID	=> open,
            M_AXIS_TDATA	=> open,
            M_AXIS_TSTRB	=> m00_axis_tstrb,
            M_AXIS_TLAST	=> m00_axis_tlast,
            M_AXIS_TREADY	=> m00_axis_tready
        );

    -- Add user logic here

    dds_ADC : dds_compiler_0
        PORT MAP (
            aclk => s00_axi_aclk,
            aresetn => syncReset,
            s_axis_phase_tvalid => '1',
            s_axis_phase_tdata => adcPhaseIncrement,
            m_axis_data_tvalid => open,
            m_axis_data_tdata => dds_ADC_out --(a+i*b) imaginmary numbers are on the bottom bits
        );

    dds_tuner : dds_compiler_0
        PORT MAP (
            aclk => s00_axi_aclk,
            aresetn => syncReset,
            s_axis_phase_tvalid => '1',
            s_axis_phase_tdata => tunerPhaseIncrement,
            m_axis_data_tvalid => open,
            m_axis_data_tdata => tunerSineCosineOut --(a+i*b) imaginmary numbers are on the bottom bits
        );

    SineDataADC<=dds_ADC_out(15 downto 0);

    sineMult: sineMultiplier port map
(
            sineDataTuner=>tunerSineCosineOut,
            sineDataAdc=>SineDataADC,
            sineMultipleOutReal =>mixedADCReal,
            sineMultipleOutImag => mixedADCImag
        );

    internalILAprobe : ila_0
        PORT MAP (
            clk => s00_axi_aclk,
            probe0 => mixedADCImag(15 downto 0),
            probe1 => mixedADCImagFilter1,
            probe2=>mixedADCImagFilter2,
            probe3(0)=>filter2Imag_Valid,
            probe4(0)=>filter2Real_Valid
        );

    --REAL side of mixer output filter stage

    fir_Stage1Real : fir_filter_stage_1
        PORT MAP (
            aresetn =>syncReset,

            aclk => s00_axi_aclk,
            s_axis_data_tvalid => '1',
            s_axis_data_tready => open,
            s_axis_data_tdata => mixedADCReal(15 downto 0),
            m_axis_data_tvalid => filter1Real_Valid,
            m_axis_data_tdata => filter1dataReal
        );

    mixedADCRealFilter1<=filter1dataReal(31 downto 16);

    fir_Stage2Real : fir_filter_stage_2
        PORT MAP (
            aresetn => syncReset,
            aclk => s00_axi_aclk,
            s_axis_data_tvalid => filter1Real_Valid,
            s_axis_data_tready => open,
            s_axis_data_tdata => mixedADCRealFilter1,
            m_axis_data_tvalid => filter2Real_Valid,
            m_axis_data_tdata => filter2dataReal
        );

    mixedADCRealFilter2<=filter2dataReal(31 downto 16);


    --IMAG side of mixer output filter stage
    fir_Stage1Imag : fir_filter_stage_1
        PORT MAP (
            aresetn =>syncReset,

            aclk => s00_axi_aclk,
            s_axis_data_tvalid => '1',
            s_axis_data_tready => open,
            s_axis_data_tdata => mixedADCImag(15 downto 0),
            m_axis_data_tvalid => filter1Imag_Valid,
            m_axis_data_tdata => filter1dataImag
        );

    mixedADCImagFilter1<=filter1dataImag(31 downto 16);

    fir_Stage2Imag : fir_filter_stage_2
        PORT MAP (
            aresetn => syncReset,
            aclk => s00_axi_aclk,
            s_axis_data_tvalid => filter1Imag_Valid,
            s_axis_data_tready => open,
            s_axis_data_tdata => mixedADCImagFilter1,
            m_axis_data_tvalid => filter2Imag_Valid,
            m_axis_data_tdata => filter2dataImag
        );

    mixedADCImagFilter2<=filter2dataImag(31 downto 16);

    m00_axis_tdata<=mixedADCRealFilter2 & mixedADCImagFilter2;--a*i*b
    m00_axis_tvalid<=filter2Imag_Valid;--these should be synced in general

end arch_imp;
