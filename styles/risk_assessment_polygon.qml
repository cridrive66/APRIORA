<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology" version="3.34.9-Prizren">
  <renderer-v2 graduatedMethod="GraduatedColor" forceraster="0" enableorderby="0" referencescale="-1" type="graduatedSymbol" symbollevels="0" attr="with_variable(&#xd;&#xa;    'non_L_fields',&#xd;&#xa;    array_filter(&#xd;&#xa;        map_akeys(attributes()),&#xd;&#xa;        @element LIKE 'era_%' AND @element NOT LIKE 'eraL_%'&#xd;&#xa;    ),&#xd;&#xa;    with_variable(&#xd;&#xa;        'L_fields',&#xd;&#xa;        array_filter(&#xd;&#xa;            map_akeys(attributes()),&#xd;&#xa;            @element LIKE 'eraL_%'&#xd;&#xa;        ),&#xd;&#xa;        if(&#xd;&#xa;            array_length(@non_L_fields) > 0,&#xd;&#xa;            attribute(@non_L_fields[0]),&#xd;&#xa;            if(&#xd;&#xa;                array_length(@L_fields) > 0,&#xd;&#xa;                attribute(@L_fields[0]),&#xd;&#xa;                NULL&#xd;&#xa;            )&#xd;&#xa;        )&#xd;&#xa;    )&#xd;&#xa;)">
    <ranges>
      <range symbol="0" lower="-1000000000000.000000000000000" uuid="{edf2b36f-f5a2-47d8-ac8a-8cd62c1d5094}" upper="0.000000000000000" render="true" label="No Emission"/>
      <range symbol="1" lower="0.000000000000000" uuid="{1c2038c9-e700-4375-8d2b-5e2bbbbfed08}" upper="0.250000000000000" render="true" label="0 - 0.25"/>
      <range symbol="2" lower="0.250000000000000" uuid="{1bccefe5-cbdf-4666-a40f-be5d0367cd34}" upper="0.500000000000000" render="true" label="0.25 - 0.5"/>
      <range symbol="3" lower="0.500000000000000" uuid="{e20ba663-e90d-4038-a20d-809e92fe5704}" upper="1.000000000000000" render="true" label="0.5 - 1"/>
      <range symbol="4" lower="1.000000000000000" uuid="{6c094bff-79b1-4f09-b2ff-3c996a0bc9fa}" upper="5.000000000000000" render="true" label="1 - 5"/>
      <range symbol="5" lower="5.000000000000000" uuid="{2baf7fe7-ace0-4781-9817-6d33e2be3120}" upper="100000000.000000000000000" render="true" label="> 5"/>
    </ranges>
    <symbols>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="0" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{b30d08e9-981c-4405-94e7-6194ca2286cd}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="5,1,255,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="35,35,35,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.26" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="1" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{558079de-bf55-4d02-aea7-2479c01ea52b}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="114,218,40,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.36" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="2" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{558079de-bf55-4d02-aea7-2479c01ea52b}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="205,202,10,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.36" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="3" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{558079de-bf55-4d02-aea7-2479c01ea52b}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,127,0,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.36" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="4" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{558079de-bf55-4d02-aea7-2479c01ea52b}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,17,0,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.36" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="5" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{558079de-bf55-4d02-aea7-2479c01ea52b}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="146,0,0,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.36" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="0" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="GradientFill" id="{d3aa235a-8b22-4cfe-8020-ac333f1b90a0}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="0" type="QString" name="angle"/>
            <Option value="0,0,255,255" type="QString" name="color"/>
            <Option value="48,18,59,255" type="QString" name="color1"/>
            <Option value="122,4,3,255" type="QString" name="color2"/>
            <Option value="1" type="QString" name="color_type"/>
            <Option value="0" type="QString" name="coordinate_mode"/>
            <Option value="ccw" type="QString" name="direction"/>
            <Option value="0" type="QString" name="discrete"/>
            <Option value="255,255,255,255" type="QString" name="gradient_color2"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="gradient" type="QString" name="rampType"/>
            <Option value="0,0" type="QString" name="reference_point1"/>
            <Option value="0" type="QString" name="reference_point1_iscentroid"/>
            <Option value="1,1" type="QString" name="reference_point2"/>
            <Option value="0" type="QString" name="reference_point2_iscentroid"/>
            <Option value="rgb" type="QString" name="spec"/>
            <Option value="0" type="QString" name="spread"/>
            <Option value="0.0039063;50,21,67,255;rgb;ccw:0.0078125;51,24,74,255;rgb;ccw:0.0117188;52,27,81,255;rgb;ccw:0.015625;53,30,88,255;rgb;ccw:0.0195313;54,33,95,255;rgb;ccw:0.0234375;55,36,102,255;rgb;ccw:0.0273438;56,39,109,255;rgb;ccw:0.03125;57,42,115,255;rgb;ccw:0.0351563;58,45,121,255;rgb;ccw:0.0390625;59,47,128,255;rgb;ccw:0.0429688;60,50,134,255;rgb;ccw:0.046875;61,53,139,255;rgb;ccw:0.0507813;62,56,145,255;rgb;ccw:0.0546875;63,59,151,255;rgb;ccw:0.0585938;63,62,156,255;rgb;ccw:0.0625;64,64,162,255;rgb;ccw:0.0664063;65,67,167,255;rgb;ccw:0.0703125;65,70,172,255;rgb;ccw:0.0742188;66,73,177,255;rgb;ccw:0.078125;66,75,181,255;rgb;ccw:0.0820313;67,78,186,255;rgb;ccw:0.0859375;68,81,191,255;rgb;ccw:0.0898438;68,84,195,255;rgb;ccw:0.09375;68,86,199,255;rgb;ccw:0.0976563;69,89,203,255;rgb;ccw:0.101563;69,92,207,255;rgb;ccw:0.105469;69,94,211,255;rgb;ccw:0.109375;70,97,214,255;rgb;ccw:0.113281;70,100,218,255;rgb;ccw:0.117188;70,102,221,255;rgb;ccw:0.121094;70,105,224,255;rgb;ccw:0.125;70,107,227,255;rgb;ccw:0.128906;71,110,230,255;rgb;ccw:0.132813;71,113,233,255;rgb;ccw:0.136719;71,115,235,255;rgb;ccw:0.140625;71,118,238,255;rgb;ccw:0.144531;71,120,240,255;rgb;ccw:0.148438;71,123,242,255;rgb;ccw:0.152344;70,125,244,255;rgb;ccw:0.15625;70,128,246,255;rgb;ccw:0.160156;70,130,248,255;rgb;ccw:0.164063;70,133,250,255;rgb;ccw:0.167969;70,135,251,255;rgb;ccw:0.171875;69,138,252,255;rgb;ccw:0.175781;69,140,253,255;rgb;ccw:0.179688;68,143,254,255;rgb;ccw:0.183594;67,145,254,255;rgb;ccw:0.1875;66,148,255,255;rgb;ccw:0.191406;65,150,255,255;rgb;ccw:0.195313;64,153,255,255;rgb;ccw:0.199219;62,155,254,255;rgb;ccw:0.203125;61,158,254,255;rgb;ccw:0.207031;59,160,253,255;rgb;ccw:0.210938;58,163,252,255;rgb;ccw:0.214844;56,165,251,255;rgb;ccw:0.21875;55,168,250,255;rgb;ccw:0.222656;53,171,248,255;rgb;ccw:0.226563;51,173,247,255;rgb;ccw:0.230469;49,175,245,255;rgb;ccw:0.234375;47,178,244,255;rgb;ccw:0.238281;46,180,242,255;rgb;ccw:0.242188;44,183,240,255;rgb;ccw:0.246094;42,185,238,255;rgb;ccw:0.25;40,188,235,255;rgb;ccw:0.253906;39,190,233,255;rgb;ccw:0.257813;37,192,231,255;rgb;ccw:0.261719;35,195,228,255;rgb;ccw:0.265625;34,197,226,255;rgb;ccw:0.269531;32,199,223,255;rgb;ccw:0.273438;31,201,221,255;rgb;ccw:0.277344;30,203,218,255;rgb;ccw:0.28125;28,205,216,255;rgb;ccw:0.285156;27,208,213,255;rgb;ccw:0.289063;26,210,210,255;rgb;ccw:0.292969;26,212,208,255;rgb;ccw:0.296875;25,213,205,255;rgb;ccw:0.300781;24,215,202,255;rgb;ccw:0.304688;24,217,200,255;rgb;ccw:0.308594;24,219,197,255;rgb;ccw:0.3125;24,221,194,255;rgb;ccw:0.316406;24,222,192,255;rgb;ccw:0.320313;24,224,189,255;rgb;ccw:0.324219;25,226,187,255;rgb;ccw:0.328125;25,227,185,255;rgb;ccw:0.332031;26,228,182,255;rgb;ccw:0.335938;28,230,180,255;rgb;ccw:0.339844;29,231,178,255;rgb;ccw:0.34375;31,233,175,255;rgb;ccw:0.347656;32,234,172,255;rgb;ccw:0.351563;34,235,170,255;rgb;ccw:0.355469;37,236,167,255;rgb;ccw:0.359375;39,238,164,255;rgb;ccw:0.363281;42,239,161,255;rgb;ccw:0.367188;44,240,158,255;rgb;ccw:0.371094;47,241,155,255;rgb;ccw:0.375;50,242,152,255;rgb;ccw:0.378906;53,243,148,255;rgb;ccw:0.382813;56,244,145,255;rgb;ccw:0.386719;60,245,142,255;rgb;ccw:0.390625;63,246,138,255;rgb;ccw:0.394531;67,247,135,255;rgb;ccw:0.398438;70,248,132,255;rgb;ccw:0.402344;74,248,128,255;rgb;ccw:0.40625;78,249,125,255;rgb;ccw:0.410156;82,250,122,255;rgb;ccw:0.414063;85,250,118,255;rgb;ccw:0.417969;89,251,115,255;rgb;ccw:0.421875;93,252,111,255;rgb;ccw:0.425781;97,252,108,255;rgb;ccw:0.429688;101,253,105,255;rgb;ccw:0.433594;105,253,102,255;rgb;ccw:0.4375;109,254,98,255;rgb;ccw:0.441406;113,254,95,255;rgb;ccw:0.445313;117,254,92,255;rgb;ccw:0.449219;121,254,89,255;rgb;ccw:0.453125;125,255,86,255;rgb;ccw:0.457031;128,255,83,255;rgb;ccw:0.460938;132,255,81,255;rgb;ccw:0.464844;136,255,78,255;rgb;ccw:0.46875;139,255,75,255;rgb;ccw:0.472656;143,255,73,255;rgb;ccw:0.476563;146,255,71,255;rgb;ccw:0.480469;150,254,68,255;rgb;ccw:0.484375;153,254,66,255;rgb;ccw:0.488281;156,254,64,255;rgb;ccw:0.492188;159,253,63,255;rgb;ccw:0.496094;161,253,61,255;rgb;ccw:0.5;164,252,60,255;rgb;ccw:0.503906;167,252,58,255;rgb;ccw:0.507813;169,251,57,255;rgb;ccw:0.511719;172,251,56,255;rgb;ccw:0.515625;175,250,55,255;rgb;ccw:0.519531;177,249,54,255;rgb;ccw:0.523438;180,248,54,255;rgb;ccw:0.527344;183,247,53,255;rgb;ccw:0.53125;185,246,53,255;rgb;ccw:0.535156;188,245,52,255;rgb;ccw:0.539063;190,244,52,255;rgb;ccw:0.542969;193,243,52,255;rgb;ccw:0.546875;195,241,52,255;rgb;ccw:0.550781;198,240,52,255;rgb;ccw:0.554688;200,239,52,255;rgb;ccw:0.558594;203,237,52,255;rgb;ccw:0.5625;205,236,52,255;rgb;ccw:0.566406;208,234,52,255;rgb;ccw:0.570313;210,233,53,255;rgb;ccw:0.574219;212,231,53,255;rgb;ccw:0.578125;215,229,53,255;rgb;ccw:0.582031;217,228,54,255;rgb;ccw:0.585938;219,226,54,255;rgb;ccw:0.589844;221,224,55,255;rgb;ccw:0.59375;223,223,55,255;rgb;ccw:0.597656;225,221,55,255;rgb;ccw:0.601563;227,219,56,255;rgb;ccw:0.605469;229,217,56,255;rgb;ccw:0.609375;231,215,57,255;rgb;ccw:0.613281;233,213,57,255;rgb;ccw:0.617188;235,211,57,255;rgb;ccw:0.621094;236,209,58,255;rgb;ccw:0.625;238,207,58,255;rgb;ccw:0.628906;239,205,58,255;rgb;ccw:0.632813;241,203,58,255;rgb;ccw:0.636719;242,201,58,255;rgb;ccw:0.640625;244,199,58,255;rgb;ccw:0.644531;245,197,58,255;rgb;ccw:0.648438;246,195,58,255;rgb;ccw:0.652344;247,193,58,255;rgb;ccw:0.65625;248,190,57,255;rgb;ccw:0.660156;249,188,57,255;rgb;ccw:0.664063;250,186,57,255;rgb;ccw:0.667969;251,184,56,255;rgb;ccw:0.671875;251,182,55,255;rgb;ccw:0.675781;252,179,54,255;rgb;ccw:0.679688;252,177,54,255;rgb;ccw:0.683594;253,174,53,255;rgb;ccw:0.6875;253,172,52,255;rgb;ccw:0.691406;254,169,51,255;rgb;ccw:0.695313;254,167,50,255;rgb;ccw:0.699219;254,164,49,255;rgb;ccw:0.703125;254,161,48,255;rgb;ccw:0.707031;254,158,47,255;rgb;ccw:0.710938;254,155,45,255;rgb;ccw:0.714844;254,153,44,255;rgb;ccw:0.71875;254,150,43,255;rgb;ccw:0.722656;254,147,42,255;rgb;ccw:0.726563;254,144,41,255;rgb;ccw:0.730469;253,141,39,255;rgb;ccw:0.734375;253,138,38,255;rgb;ccw:0.738281;252,135,37,255;rgb;ccw:0.742188;252,132,35,255;rgb;ccw:0.746094;251,129,34,255;rgb;ccw:0.75;251,126,33,255;rgb;ccw:0.753906;250,123,31,255;rgb;ccw:0.757813;249,120,30,255;rgb;ccw:0.761719;249,117,29,255;rgb;ccw:0.765625;248,114,28,255;rgb;ccw:0.769531;247,111,26,255;rgb;ccw:0.773438;246,108,25,255;rgb;ccw:0.777344;245,105,24,255;rgb;ccw:0.78125;244,102,23,255;rgb;ccw:0.785156;243,99,21,255;rgb;ccw:0.789063;242,96,20,255;rgb;ccw:0.792969;241,93,19,255;rgb;ccw:0.796875;240,91,18,255;rgb;ccw:0.800781;239,88,17,255;rgb;ccw:0.804688;237,85,16,255;rgb;ccw:0.808594;236,83,15,255;rgb;ccw:0.8125;235,80,14,255;rgb;ccw:0.816406;234,78,13,255;rgb;ccw:0.820313;232,75,12,255;rgb;ccw:0.824219;231,73,12,255;rgb;ccw:0.828125;229,71,11,255;rgb;ccw:0.832031;228,69,10,255;rgb;ccw:0.835938;226,67,10,255;rgb;ccw:0.839844;225,65,9,255;rgb;ccw:0.84375;223,63,8,255;rgb;ccw:0.847656;221,61,8,255;rgb;ccw:0.851563;220,59,7,255;rgb;ccw:0.855469;218,57,7,255;rgb;ccw:0.859375;216,55,6,255;rgb;ccw:0.863281;214,53,6,255;rgb;ccw:0.867188;212,51,5,255;rgb;ccw:0.871094;210,49,5,255;rgb;ccw:0.875;208,47,5,255;rgb;ccw:0.878906;206,45,4,255;rgb;ccw:0.882813;204,43,4,255;rgb;ccw:0.886719;202,42,4,255;rgb;ccw:0.890625;200,40,3,255;rgb;ccw:0.894531;197,38,3,255;rgb;ccw:0.898438;195,37,3,255;rgb;ccw:0.902344;193,35,2,255;rgb;ccw:0.90625;190,33,2,255;rgb;ccw:0.910156;188,32,2,255;rgb;ccw:0.914063;185,30,2,255;rgb;ccw:0.917969;183,29,2,255;rgb;ccw:0.921875;180,27,1,255;rgb;ccw:0.925781;178,26,1,255;rgb;ccw:0.929688;175,24,1,255;rgb;ccw:0.933594;172,23,1,255;rgb;ccw:0.9375;169,22,1,255;rgb;ccw:0.941406;167,20,1,255;rgb;ccw:0.945313;164,19,1,255;rgb;ccw:0.949219;161,18,1,255;rgb;ccw:0.953125;158,16,1,255;rgb;ccw:0.957031;155,15,1,255;rgb;ccw:0.960938;152,14,1,255;rgb;ccw:0.964844;149,13,1,255;rgb;ccw:0.96875;146,11,1,255;rgb;ccw:0.972656;142,10,1,255;rgb;ccw:0.976563;139,9,2,255;rgb;ccw:0.980469;136,8,2,255;rgb;ccw:0.984375;133,7,2,255;rgb;ccw:0.988281;129,6,2,255;rgb;ccw" type="QString" name="stops"/>
            <Option value="1" type="QString" name="type"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" class="SimpleFill" id="{558079de-bf55-4d02-aea7-2479c01ea52b}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="247,247,247,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0,0,0,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.36" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="no" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <colorramp type="gradient" name="[source]">
      <Option type="Map">
        <Option value="255,255,255,255" type="QString" name="color1"/>
        <Option value="255,0,0,255" type="QString" name="color2"/>
        <Option value="ccw" type="QString" name="direction"/>
        <Option value="0" type="QString" name="discrete"/>
        <Option value="gradient" type="QString" name="rampType"/>
        <Option value="rgb" type="QString" name="spec"/>
      </Option>
    </colorramp>
    <classificationMethod id="Quantile">
      <symmetricMode astride="0" enabled="0" symmetrypoint="0"/>
      <labelFormat trimtrailingzeroes="1" format="%1 - %2" labelprecision="1"/>
      <parameters>
        <Option/>
      </parameters>
      <extraInformation/>
    </classificationMethod>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol is_animated="0" frame_rate="10" clip_to_extent="1" type="fill" name="" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" id="{b6b65f08-d62f-4fc9-b48e-aefd73271197}" locked="0" enabled="1">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="0,0,255,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="35,35,35,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.26" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerGeometryType>2</layerGeometryType>
</qgis>
