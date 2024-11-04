// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saheel_machine_test/bloc/banner_bloc.dart';
import 'package:saheel_machine_test/bloc/search_bloc.dart';
import 'package:saheel_machine_test/bloc/sub_category_bloc.dart';
import 'package:saheel_machine_test/utils/app_colors.dart';
import 'package:saheel_machine_test/utils/app_constants.dart';
import 'package:saheel_machine_test/utils/config.dart';
import 'package:saheel_machine_test/widgets/banner_carousel.dart';
import 'package:saheel_machine_test/widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<BannerBloc>().add(FetchBanners());
      context.read<SubcategoryBloc>().add(FetchSubCategories());
      context.read<SearchBloc>().add(SearchDishes(""));
    });
    super.initState();
  }

  void _onSearchChanged(String query) {
    context.read<SearchBloc>().add(SearchDishes(query));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<BannerBloc, BannerState>(
            builder: (context, state) {
              if (state is BannerLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BannerLoaded) {
                return Column(
                  children: [
                    AppConstants.sbh30,
                    AppBarWidget(size: size),
                    BannerCarousel(banners: state.banners),
                    AppConstants.sbh10,
                    Padding(
                      padding: const EdgeInsets.only(
                          left: AppConstants.padLeft10,
                          right: AppConstants.padLeft10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("Your Table No"),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      backgroundColor:
                                      AppColors.tableButtonColor),
                                  child: const Text("T No : LFT - A1"))
                            ],
                          ),
                          Column(
                            children: [
                              const Text(""),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      backgroundColor:
                                      AppColors.downloadMenuColor),
                                  onPressed: () {},
                                  child: const Text(
                                    "Download Menu",
                                    style:
                                    TextStyle(color: AppColors.appTextDarkColor),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    AppConstants.sbh10,
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: "Sign up ",
                              style: TextStyle(
                                  color: AppColors.signUpTodayColor,
                                  fontSize: 15,
                                  fontWeight: AppConstants.fontWeight700)),
                          TextSpan(
                              text: "today unlock exclusive offers!")
                        ])),
                    AppConstants.sbh10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: 50,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: AppColors.pinkColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.only(left: AppConstants.padLeft13),
                                        child: Text(
                                          "Our Signature dish",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ))),
                              const Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 182,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColors.appTextColor,
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 50,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: AppColors.purpleColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.only(left: AppConstants.padLeft13),
                                      child: Text(
                                        "Today's special",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    )),
                              ),
                              const Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 182,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.appTextColor,
                                    radius: 30,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Search Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: "Search Dish",
                          hintStyle: TextStyle(color: AppColors.appTextColor),
                          suffixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.all(4),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onChanged: _onSearchChanged,
                      ),
                    ),

                    AppConstants.sbh30,

                    Expanded(
                      child: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, searchState) {
                          if (_searchController.text.isNotEmpty) {
                            if (searchState is SearchLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (searchState is SearchLoaded) {
                              if (searchState.searchResults.results!.isEmpty ?? true) {
                                return Center(child: Text('No results found'));
                              }
                              return Container(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: searchState.searchResults.results!.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final dish = searchState.searchResults.results![index];
                                    return  Card(
                                      child: Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                            color: AppColors.tableButtonColor,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Column(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(dish.dishname ?? ""),
                                          ),
                                          Container(
                                            height: 120,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        Config.baseUrl + (dish.photo ?? "")
                                                    )
                                                )),
                                          ),
                                          Text("View all >", style: TextStyle(color: AppColors.yellowLight)),
                                        ]),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (searchState is SearchError) {
                              return Center(child: Text('Error: ${searchState.message}'));
                            }
                          }

                          return BlocBuilder<SubcategoryBloc, SubcategoryState>(
                            builder: (context, subcategoryState) {
                              if (subcategoryState is SubcategoryLoading) {
                                return Center(child: CupertinoActivityIndicator());
                              } else if (subcategoryState is SubcategoryLoaded) {
                                return ListView.builder(
                                  itemCount: subcategoryState.subCategories.length,
                                  itemBuilder: (context, categoryIndex) {
                                    return Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.tableButtonColor,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(11.0),
                                              child: Text(subcategoryState.subCategories[categoryIndex].category ?? ""),
                                            ),
                                          ),
                                        ),
                                        AppConstants.sbh30,
                                        SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            itemCount: subcategoryState.subCategories[categoryIndex].subcategories?.length ?? 0,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, subCategoryIndex) {
                                              return Card(
                                                child: Container(
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.tableButtonColor,
                                                      borderRadius: BorderRadius.circular(15)),
                                                  child: Column(children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(subcategoryState.subCategories[categoryIndex].subcategories?[subCategoryIndex].subcategory ?? ""),
                                                    ),
                                                    Container(
                                                      height: 120,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  Config.baseUrl + (subcategoryState.subCategories[categoryIndex].subcategories?[subCategoryIndex].subcatimage ?? "")
                                                              )
                                                          )),
                                                    ),
                                                    Text("View all >", style: TextStyle(color: AppColors.yellowLight)),
                                                  ]),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                              } else {
                                return Center(child: Text("No Data"));
                              }
                            },
                          );
                        },
                      ),
                    )
                  ],
                );
              } else if (state is BannerError) {
                return Center(child: Text('Failed to load banners: ${state.message}'));
              }
              return const Center(child: Text('Unexpected state'));
            },
          ),
        ),
      ),
    );
  }
}
