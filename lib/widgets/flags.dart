import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const icons = {
  'aed.png',
  'afn.png',
  'all.png',
  'amd.png',
  'ang.png',
  'aoa.png',
  'ars.png',
  'aud.png',
  'awg.png',
  'azn.png',
  'bam.png',
  'bbd.png',
  'bdt.png',
  'bgn.png',
  'bhd.png',
  'bif.png',
  'bmd.png',
  'bnd.png',
  'bob.png',
  'brl.png',
  'bsd.png',
  'btn.png',
  'bwp.png',
  'byn.png',
  'bzd.png',
  'cad.png',
  'cdf.png',
  'chf.png',
  'clp.png',
  'cny.png',
  'cop.png',
  'crc.png',
  'cup.png',
  'cve.png',
  'czk.png',
  'djf.png',
  'dkk.png',
  'dop.png',
  'dzd.png',
  'egp.png',
  'ern.png',
  'etb.png',
  'eur.png',
  'fjd.png',
  'fkp.png',
  'gbp.png',
  'gel.png',
  'ghs.png',
  'gip.png',
  'gmd.png',
  'gnf.png',
  'gtq.png',
  'gyd.png',
  'hkd.png',
  'hnl.png',
  'hrk.png',
  'htg.png',
  'huf.png',
  'idr.png',
  'ils.png',
  'inr.png',
  'iqd.png',
  'irr.png',
  'isk.png',
  'jmd.png',
  'jod.png',
  'jpy.png',
  'kes.png',
  'kgs.png',
  'khr.png',
  'kmf.png',
  'kpw.png',
  'krw.png',
  'kwd.png',
  'kyd.png',
  'kzt.png',
  'lak.png',
  'lbp.png',
  'lkr.png',
  'lrd.png',
  'ltl.png',
  'lyd.png',
  'mad.png',
  'mdl.png',
  'mga.png',
  'mkd.png',
  'mmk.png',
  'mnt.png',
  'mop.png',
  'mro.png',
  'mur.png',
  'mvr.png',
  'mwk.png',
  'mxn.png',
  'myr.png',
  'mzn.png',
  'nad.png',
  'ngn.png',
  'nio.png',
  'nok.png',
  'npr.png',
  'nzd.png',
  'omr.png',
  'pen.png',
  'pgk.png',
  'php.png',
  'pkr.png',
  'pln.png',
  'pyg.png',
  'qar.png',
  'ron.png',
  'rsd.png',
  'rub.png',
  'rwf.png',
  'sar.png',
  'sbd.png',
  'scr.png',
  'sek.png',
  'sgd.png',
  'shp.png',
  'sll.png',
  'sos.png',
  'srd.png',
  'std.png',
  'svc.png',
  'syp.png',
  'szl.png',
  'thb.png',
  'tjs.png',
  'tnd.png',
  'top.png',
  'try.png',
  'ttd.png',
  'twd.png',
  'tzs.png',
  'uah.png',
  'ugx.png',
  'usd.png',
  'uyu.png',
  'uzs.png',
  'vef.png',
  'vnd.png',
  'vuv.png',
  'wst.png',
  'xaf.png',
  'xcd.png',
  'xof.png',
  'xpf.png',
  'yer.png',
  'zar.png',
  'zmw.png',
};

class Flags extends StatelessWidget {
  Flags({@required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final file = '${code.toLowerCase()}.png';

    if (icons.contains(file)) {
      return Image.asset('icons/currency/$file', package: 'currency_icons');
    } else {
      return CircleAvatar(backgroundColor: Colors.black);
    }
  }
}