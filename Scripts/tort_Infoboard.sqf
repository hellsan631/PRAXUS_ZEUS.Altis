private "_runs";
if (tort_infoboard_permanent == -1) then {_runs = 2} else {_runs = 10000};

for "_k" from 1 to _runs do {
   _cycle = round(tort_transitionSpeed /60);
   _rnd1 = floor((tort_rndChange select 0) * 100);
   if (tort_trend=="random") then {_rnd1 = 100};
   _rnd2 = round(_rnd1 * (tort_rndChange select 1));

   _Stxt = parseText format
   ["
   <t color='#ffffff'>TREND: </t><t color='#ffffff'>%1</t><br/>
   <t color='#ffffff'>CYCLE: </t><t color='#FFFFFF'>%2 minutes</t><br/>
   <t color='#ffffff'>RND: </t><t color='#FFFFFF'>%3/%4 percent</t><br/>
   <br/>
   <t color='#ffffff'>OVC: </t><t color='#CCCCCC'>MIN:%5</t><t color='#00ff00'> %6</t><t color='#ffffff'>->%7</t><t color='#CCCCCC'> MAX:%8</t><br/>

   <t color='#ffffff'>FOG: </t><t color='#CCCCCC'>MIN:%10</t><t color='#00ff00'> %11</t><t color='#ffffff'>->%12</t><t color='#CCCCCC'> MAX:%13</t><br/>
   <t color='#ffffff'>WND: </t><t color='#CCCCCC'>MIN:%14</t><t color='#00ff00'> %15</t><t color='#ffffff'>->%16</t><t color='#CCCCCC'> MAX:%17</t><br/>
   <t color='#ffffff'>WGU: </t><t color='#00ff00'>%18</t><t color='#ffffff'>->%19</t><br/>
   <t color='#ffffff'>WDIR: </t><t color='#00ff00'>%20</t><t color='#ffffff'>->%21</t><br/>
   <t color='#ffffff'>RAIN: </t><t color='#00ff00'>%22</t> (ArmA controlled)<br/>
   <br/>
   <t color='#ffffff'>SEED: </t><t color='#FFFFFF'>#%23</t>
   ",

   tort_trend,
   _cycle,
   _rnd1,
   _rnd2,
   floor((tort_minmax select 0)*100)/100,
   floor(overcast*100)/100,
   floor(tort_overcast*100)/100,
   floor((tort_minmax select 1)*100)/100,
   floor((simulCloudDensity (getPos player))*100)/100,
   floor((tort_minmax select 2)*100)/100,
   floor(fog*100)/100,
   floor(tort_fog*100)/100,
   floor((tort_minmax select 3)*100)/100,
   floor((tort_minmax select 4)*100)/100,
   floor(windstr*100)/100,
   floor(tort_windstr*100)/100,
   floor((tort_minmax select 5)*100)/100,
   floor(gusts*100)/100,
   floor(tort_gusts*100)/100,
   floor(winddir),
   floor(tort_winddir),
   floor(rain*100)/100,
   tort_seed
   ];
   hintsilent _Stxt;
   sleep 5;
   if (tort_infoboard_permanent == 0) exitWith {};
};

tort_infoboard_permanent = 0;

//    <t color='#ffffff'>CLD: </t><t color='#00ff00'> %9</t><br/>