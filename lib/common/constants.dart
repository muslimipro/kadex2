import 'package:flutter/material.dart';

// const primaryColor = Color(0xFF773EF5);
// const secondaryColor = Color(0xFF773EF5); //Color(0xFF2A2D3E);
// const bgColor = Color(0xFF773EF5); // Color(0xFF212332);

const grayscaleDark = Color(0xFF14142B);
const grayscaleDarkmode = Color(0xFF6E7191);
const grayscaleAverage = Color(0xFFA0A3BD);
const grayscaleLight = Color(0xFFEFF0F6);
const grayscaleExtralight = Color(0xFFF7F7FC);
const grayscaleWhite = Color(0xFFFFFFFF);
const grayscaleOffWhite = Color(0xFFFCFCFC);

const primaryDefault = Color(0xFF773EF5);
const primaryDark = Color(0xFF4F16CD);
const primaryLight = Color(0xFFE4DCFF);
const primaryExtralight = Color(0xFFF5F1FD);

const secondaryDefault = Color(0xFFDC4FFF);
const secondaryLight = Color(0xFFF6D1FF);

const otherSuccess = Color(0xFF3DCAB0);
const otherError = Color(0xFFFF4F79);
const otherAzure = Color(0xFF2CC7DC);
const otherBlue = Color(0xFF3177FF);

const defaultPadding = 16.0;

double buttonWidth = 175.0;

final ButtonStyle primaryLightButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(primaryLight),
  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, 60)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) return primaryExtralight;
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) return primaryLight;
      return null;
    },
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      // side: BorderSide(color: Colors.red),
    ),
  ),
);
final ButtonStyle primaryDefaultButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(primaryDefault),
  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, 60)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) return primaryDark;
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) return primaryDefault;
      return null;
    },
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);

final ButtonStyle whiteButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(grayscaleWhite),
  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, 60)),
  overlayColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) return grayscaleExtralight;
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) return grayscaleWhite;
      return null;
    },
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);

final BoxShadow boxShadow = BoxShadow(
  color: grayscaleAverage.withOpacity(0.22),
  blurRadius: 10,
  offset: Offset(0, 2),
);

final BoxDecoration borderedBox = BoxDecoration(
  border: Border.all(
    width: 1,
    color: grayscaleLight,
  ),
  borderRadius: BorderRadius.circular(20),
);

final TextStyle blockTitleStyle = TextStyle(
  color: grayscaleDark,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);
TextStyle titleRegular = TextStyle(
  color: grayscaleDark,
  fontSize: 24,
  fontWeight: FontWeight.w400,
);

TextStyle blockTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: grayscaleDark,
);
TextStyle blockSubtitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: grayscaleDarkmode,
);
TextStyle footnoteSemibold = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: grayscaleDark,
);
TextStyle footnoteRegular = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: grayscaleDark,
);

class PieDot extends StatelessWidget {
  final Color color;
  final String name;

  PieDot({
    @required this.name,
    this.color = grayscaleAverage,
  });

  @override
  Widget build(BuildContext context) {
    final double diameter = 12;
    return Row(
      children: [
        Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Text(
          name,
          style: blockTextStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

class StepCircle extends StatelessWidget {
  final String number;
  StepCircle({this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: primaryDefault,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          number,
          style: blockTextStyle.copyWith(
            color: grayscaleWhite,
          ),
        ),
      ),
    );
  }
}

List<String> allCoins = [
  '1INCH',
  'AAVE',
  'ABBC',
  'ADA',
  'ADX',
  'AION',
  'AKT',
  'ALBT',
  'ALCX',
  'ALGO',
  'ALICE',
  'ALPHA',
  'AMP',
  'AMPL',
  'ANC',
  'ANKR',
  'ANT',
  'APL',
  'AR',
  'ARDR',
  'ARK',
  'ARRR',
  'ASTA',
  'ATOM',
  'ATRI',
  'AUDIO',
  'AVA',
  'AVAX',
  'AXS',
  'BADGER',
  'BAKE',
  'BAL',
  'BAND',
  'BAT',
  'BCD',
  'BCH',
  'BCHA',
  'BCN',
  'BEAM',
  'BELT',
  'BEST',
  'BLCT',
  'BNANA',
  'BNB',
  'BNT',
  'BOND',
  'BORA',
  'BOTX',
  'BSV',
  'BTC',
  'BTCB',
  'BTCST',
  'BTG',
  'BTM',
  'BTMX',
  'BTS',
  'BTT',
  'BURGER',
  'BUSD',
  'BZRX',
  'C20',
  'CAKE',
  'CCXX',
  'CEL',
  'CELO',
  'CELR',
  'CENNZ',
  'CFX',
  'CHR',
  'CHSB',
  'CHZ',
  'CITY',
  'CKB',
  'COMP',
  'COTI',
  'CRE',
  'CREAM',
  'CRO',
  'CRU',
  'CRV',
  'CTC',
  'CTSI',
  'CVC',
  'DAI',
  'DAO',
  'DASH',
  'DAWN',
  'DCR',
  'DDX',
  'DENT',
  'DFI',
  'DGB',
  'DIA',
  'DIVI',
  'DKA',
  'DNT',
  'DODO',
  'DOGE',
  'DOT',
  'DRS',
  'DVI',
  'DX',
  'EDG',
  'EGLD',
  'ELA',
  'ELF',
  'ELON',
  'ENJ',
  'EOS',
  'EPS',
  'ERC20',
  'ERG',
  'ETC',
  'ETH',
  'ETN',
  'EUM',
  'EURS',
  'EWT',
  'EXRD',
  'FEI',
  'FET',
  'FIDA',
  'FIL',
  'FIRO',
  'FLM',
  'FLOW',
  'FORTH',
  'FRAX',
  'FTM',
  'FTT',
  'FUN',
  'FX',
  'GALA',
  'GAS',
  'GLM',
  'GNO',
  'GNY',
  'GRN',
  'GRS',
  'GRT',
  'GT',
  'GUSD',
  'HBAR',
  'HBTC',
  'HEDG',
  'HEGIC',
  'HEX',
  'HIVE',
  'HNC',
  'HNS',
  'HNT',
  'HOGE',
  'HOT',
  'HT',
  'HTR',
  'HUSD',
  'HXRO',
  'ICP',
  'ICX',
  'INJ',
  'INO',
  'IOST',
  'IOTX',
  'IQ',
  'IRIS',
  'JGN',
  'JST',
  'KAI',
  'KARMA',
  'KAVA',
  'KCS',
  'KDA',
  'KEEP',
  'KIN',
  'KLAY',
  'KLV',
  'KMD',
  'KNC',
  'KSM',
  'KSP',
  'LAMB',
  'LEO',
  'LINA',
  'LINK',
  'LIT',
  'LOC',
  'LON',
  'LOOM',
  'LOTTO',
  'LPT',
  'LQTY',
  'LRC',
  'LSK',
  'LTC',
  'LUNA',
  'LUSD',
  'LYXe',
  'MAID',
  'MANA',
  'MARO',
  'MASK',
  'MATH',
  'MATIC',
  'MBN',
  'MCO',
  'MDX',
  'MED',
  'META',
  'MFT',
  'MIOTA',
  'MIR',
  'MKR',
  'MLK',
  'MLN',
  'MONA',
  'MTL',
  'MVL',
  'MWC',
  'MX',
  'MXC',
  'NANO',
  'NEAR',
  'NEO',
  'NEXO',
  'NKN',
  'NMR',
  'NOIA',
  'NRG',
  'NRV',
  'NU',
  'NWC',
  'NXM',
  'NYE',
  'OCEAN',
  'OGN',
  'OKB',
  'OMG',
  'OMI',
  'ONE',
  'ONG',
  'ONOT',
  'ONT',
  'ORBS',
  'ORC',
  'ORN',
  'OXT',
  'OXY',
  'PAC',
  'PAX',
  'PAXG',
  'PERP',
  'PHA',
  'PNK',
  'POLS',
  'POLY',
  'POND',
  'POWR',
  'PPT',
  'PROM',
  'PRQ',
  'PUNDIX',
  'QC',
  'QKC',
  'QNT',
  'QTUM',
  'QUICK',
  'RAMP',
  'RAY',
  'RDD',
  'REEF',
  'REN',
  'RENBTC',
  'REP',
  'REQ',
  'REV',
  'RFOX',
  'RGT',
  'RIF',
  'RLC',
  'RLY',
  'RNDR',
  'ROSE',
  'RPD',
  'RPL',
  'RSR',
  'RUNE',
  'RVN',
  'SAFEMOON',
  'SAND',
  'SAPP',
  'SC',
  'SCRT',
  'SERO',
  'SFP',
  'SHIB',
  'SKL',
  'SLP',
  'SNL',
  'SNM',
  'SNT',
  'SNX',
  'SOL',
  'SOLO',
  'SOLVE',
  'SRM',
  'STC',
  'STEEM',
  'STETH',
  'STMX',
  'STORJ',
  'STRAX',
  'STRK',
  'STX',
  'SUN',
  'SUPER',
  'SURE',
  'SUSD',
  'SUSHI',
  'SWAP',
  'SXP',
  'SYS',
  'TEL',
  'TFUEL',
  'THETA',
  'THR',
  'TITAN',
  'TKO',
  'TLM',
  'TLOS',
  'TOMO',
  'TRAC',
  'TRB',
  'TRIBE',
  'TROY',
  'TRX',
  'TT',
  'TTT',
  'TUSD',
  'TWT',
  'UBT',
  'UMA',
  'UNI',
  'UOS',
  'UQC',
  'USDC',
  'USDN',
  'USDT',
  'UST',
  'UTK',
  'VAI',
  'VET',
  'VGX',
  'VLX',
  'VRSC',
  'VTHO',
  'WAN',
  'WAVES',
  'WAXP',
  'WBNB',
  'WBTC',
  'WHALE',
  'WIN',
  'WNXM',
  'WOO',
  'WOZX',
  'WRX',
  'XCM',
  'XDC',
  'XEM',
  'XHV',
  'XIN',
  'XLM',
  'XMR',
  'XNC',
  'XOR',
  'XPRT',
  'XRP',
  'XTZ',
  'XVG',
  'XVS',
  'XWC',
  'XYM',
  'XYO',
  'YFI',
  'YFII',
  'YOUC',
  'ZB',
  'ZEC',
  'ZEN',
  'ZIL',
  'ZKS',
  'ZLW',
  'ZRX',
  'aEth',
  'vBNB',
  'vBTC',
  'vETH',
  'vUSDC',
  'vXVS',
];
