import 'package:app_absensi_puskesmas/models/absensi_model.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DetailReportAbsenPegawai extends StatefulWidget {
  const DetailReportAbsenPegawai({super.key});

  @override
  State<DetailReportAbsenPegawai> createState() =>
      _DetailReportAbsenPegawaiState();
}

class _DetailReportAbsenPegawaiState extends State<DetailReportAbsenPegawai> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMEEEEd('id');
    timeFormat = DateFormat.Hm('id');
  }

  Widget dataPegawai(String nama, String jabatan) {
    return SizedBox(
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: grayColor,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: openSansTextStyle.copyWith(
                  fontSize: 15,
                  color: blackColor,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                jabatan,
                style: openSansTextStyle.copyWith(
                  fontSize: 8,
                  fontWeight: regular,
                  color: grayColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dataAbsenMasuk(String waktuHadir) {
    final tanggalHadir =
        dateFormat.format(DateTime.parse(waktuHadir).toLocal());
    final formattedWaktuHadir =
        timeFormat.format(DateTime.parse(waktuHadir).toLocal());
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Absen Masuk',
                style: openSansTextStyle.copyWith(
                  fontSize: 8,
                  fontWeight: regular,
                  color: grayColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    tanggalHadir,
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    formattedWaktuHadir,
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/image.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget dataAbsenKeluar(String waktuPulang) {
    final tanggalPulang =
        dateFormat.format(DateTime.parse(waktuPulang).toLocal());
    final formattedWaktuPulang =
        timeFormat.format(DateTime.parse(waktuPulang).toLocal());
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Absen Keluar',
                style: openSansTextStyle.copyWith(
                  fontSize: 8,
                  fontWeight: regular,
                  color: grayColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    tanggalPulang,
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      color: blackColor,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    formattedWaktuPulang,
                    style: openSansTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/image.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final RiwayatAbsensi riwayatAbsensi =
        ModalRoute.of(context)!.settings.arguments as RiwayatAbsensi;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Daily Detail',
          style: openSansTextStyle.copyWith(
              fontSize: 16, fontWeight: semiBold, color: blackColor),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: blackColor,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            dataPegawai(
                riwayatAbsensi.user!.nama!, riwayatAbsensi.user!.jabatan!),
            const SizedBox(height: 30),
            dataAbsenMasuk(riwayatAbsensi.createdAt.toString()),
            const SizedBox(height: 30),
            dataAbsenKeluar(riwayatAbsensi.updatedAt.toString()),
          ],
        ),
      ),
    );
  }
}
