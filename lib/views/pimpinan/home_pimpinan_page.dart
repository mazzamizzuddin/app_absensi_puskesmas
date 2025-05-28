import 'package:app_absensi_puskesmas/models/user_model.dart';
import 'package:app_absensi_puskesmas/services/user_service.dart';
import 'package:app_absensi_puskesmas/theme/style.dart';
import 'package:flutter/material.dart';

class HomePagePimpinan extends StatefulWidget {
  const HomePagePimpinan({super.key});

  @override
  State<HomePagePimpinan> createState() => _HomePagePimpinanState();
}

class _HomePagePimpinanState extends State<HomePagePimpinan> {
    late Future<User> user;

  @override
  void initState() {
    user = UserService().getUserById();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
           FutureBuilder<User?>(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading ...');
                } else if (snapshot.hasData) {
                  return Text(
                    'Hello, ${snapshot.data!.nama}!',
                    style: openSansTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold, color: blackColor),
                  );
                } else {
                  return const Text('Terjadi Kesalahan');
                }
              }),
          const SizedBox(height: 10),
          Text(
            'Semoga hari ini bisa lebih baik dari kemarin',
            style: openSansTextStyle.copyWith(
                fontSize: 12, fontWeight: regular, color: grayColor),
          ),
          const SizedBox(height: 35),
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [defaultShadow],
                  border: Border.all(
                    color: const Color(0xfff1f1f1),
                    width: 1,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ada lalat di atas meja',
                      style: openSansTextStyle.copyWith(
                        fontSize: 10,
                        color: grayColor,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      'Lalat terbang di atas kepala',
                      style: openSansTextStyle.copyWith(
                        fontSize: 10,
                        color: grayColor,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      'Luruskan niat dalam bekerja',
                      style: openSansTextStyle.copyWith(
                        fontSize: 10,
                        color: grayColor,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      'supaya kerja mendapat pahala',
                      style: openSansTextStyle.copyWith(
                        fontSize: 10,
                        color: grayColor,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Jangan lupa absen',
                      style: openSansTextStyle.copyWith(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'hari ini !',
                      style: openSansTextStyle.copyWith(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Image.asset('assets/hijab.png'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/absen-pegawai');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [defaultShadow],
                    border: Border.all(
                      color: const Color(0xfff1f1f1),
                      width: 1,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/report-icon.png'),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Report Absensi Pegawai',
                          style: openSansTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: blackColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/data-pegawai');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [defaultShadow],
                    border: Border.all(
                      color: const Color(0xfff1f1f1),
                      width: 1,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/Person.png'),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Data Pegawai Puskesmas',
                          style: openSansTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: blackColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
