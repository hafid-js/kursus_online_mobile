
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kursus_online_mobile/common/widgets/texts/description.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/chapter_model.dart';
import 'package:kursus_online_mobile/features/course_detail/widgets/course_more_menu.dart';
import 'package:kursus_online_mobile/features/course_detail/widgets/qna.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/course_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({
    super.key,
    required this.course,
    required this.chapters,
  });

  final CourseModel course;
  final List<ChapterModel> chapters;



  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with WidgetsBindingObserver {
  late YoutubePlayerController _controller;
  int? _selectedId;
  String? _lessonTitle;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    final url = widget.chapters[0].lessons[0].filePath;
    final videoId = YoutubePlayer.convertUrlToId(url);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: UColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: UColors.backgroundColor,
          foregroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.pink,
              child: YoutubePlayer(
                key: ValueKey(_controller.metadata.videoId),
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _lessonTitle ?? widget.course.title,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.course.instructor!.name,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0),
                    ),
                  ),
                ),
                Row(
                  children: [
                    TabBar(
                      indicatorAnimation: TabIndicatorAnimation.linear,
                      indicatorPadding: EdgeInsets.zero,
                      labelColor: Colors.white,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 3,
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "Lectures",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Downloads",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "More",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 76),

                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) => Container(
                            height: 200,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Download Options",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),
                                ListTile(
                                  leading: Icon(
                                    Icons.video_collection,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Download Course",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.article,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Cancel Downloads",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.download_for_offline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...widget.chapters.asMap().entries.map((entry) {
                          ChapterModel chapter = entry.value;

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 16,
                                  left: 16,
                                  top: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      chapter.title,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.download_for_offline_rounded,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ],
                                ),
                              ),

                              ...chapter.lessons.asMap().entries.map((
                                lessonEntry,
                              ) {
                                int lessonIndex = lessonEntry.key;
                                var lesson = lessonEntry.value;
                                return ListTile(
                                  selected: _selectedId == lesson.id,
                                  selectedTileColor: Colors.pink,
                                  onTap: () async {
                                    final url = lesson.filePath;

                                    final videoId =
                                        YoutubePlayer.convertUrlToId(url);
                                    if (videoId != null) {
                                      _controller.load(videoId);
                                    }

                                    setState(() {
                                      _selectedId = lesson.id;
                                      _lessonTitle = lesson.title;
                                    });
                                  },
                                  contentPadding: EdgeInsets.only(
                                    right: 16,
                                    left: 16,
                                  ),
                                  minTileHeight: 0,
                                  horizontalTitleGap: 1,
                                  leading: Text(
                                    "${lessonIndex + 1}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: Colors.deepPurpleAccent,
                                        size: 18,
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          lesson.title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${UHelperFunctions.capitalize(lesson.fileType)} - ${lesson.duration} mins - Resources (2)",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.download_for_offline_rounded,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "No Downloads Yet",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Your downloaded lectures go here",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        CourseMoreMenu(
                          icon: Icons.keyboard_control_rounded,
                          title: "About this course",
                          onTap: () {
                            showBarModalBottomSheet(
                              expand: true,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                            ),
                                            Center(
                                              child: Text(
                                                "About This Course",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: Color.fromARGB(
                                            130,
                                            79,
                                            79,
                                            79,
                                          ),
                                          thickness: 1,
                                          height: 1,
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                UDescription(
                                                  description:
                                                      widget.course.description,
                                                  isShowMore: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),

                        CourseMoreMenu(
                          icon: Iconsax.medal_star,
                          title: "CourseCertificate",
                        ),
                        CourseMoreMenu(
                          icon: Icons.file_upload_outlined,
                          title: "Share this course",
                          onTap: () {
                            SharePlus.instance.share(
                              ShareParams(
                                previewThumbnail: XFile(widget.course.thumbnail),
                                text: 
                                    widget.course.title,
                                subject: widget.course.title,
                              ),
                            );
                          },
                        ),
                        CourseMoreMenu(
                          icon: Icons.messenger_outline_rounded,
                          title: "Q&A",
                          onTap: () {
                            showBarModalBottomSheet(
                              expand: true,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  Navigator.of(context).pop(),
                                              child: Text(
                                                "Close",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Q&A",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              child: Icon(
                                                Icons.filter_list_rounded,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: MediaQuery.of(
                                                    context,
                                                  ).size.width,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      showBarModalBottomSheet(
                                                        expand: true,
                                                        backgroundColor:
                                                            Colors.black,
                                                        shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                top:
                                                                    Radius.circular(
                                                                      20,
                                                                    ),
                                                              ),
                                                        ),
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return SizedBox(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        16,
                                                                  ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap: () => Navigator.of(
                                                                          context,
                                                                        ).pop(),
                                                                        child: Text(
                                                                          "Close",
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Center(
                                                                        child: Text(
                                                                          "Q&A",
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                        right:
                                                                            0,
                                                                        child: Icon(
                                                                          Icons
                                                                              .filter_list_rounded,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              25,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Expanded(
                                                                    child: SingleChildScrollView(
                                                                      child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                            width: MediaQuery.of(
                                                                              context,
                                                                            ).size.width,
                                                                            child: ElevatedButton(
                                                                              onPressed: () {
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                side: const BorderSide(
                                                                                  color: Colors.white,
                                                                                  width: 1,
                                                                                ),
                                                                                shape: const RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.zero,
                                                                                ),
                                                                              ),
                                                                              child: const Text(
                                                                                "Ask a question",
                                                                                style: TextStyle(
                                                                                  fontSize: 18,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),

                                                                          Column(
                                                                            children: [
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                              QnaSection(),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      side: const BorderSide(
                                                        color: Colors.white,
                                                        width: 1,
                                                      ),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .zero,
                                                          ),
                                                    ),
                                                    child: const Text(
                                                      "Ask a question",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 15),

                                                Column(
                                                  children: [
                                                    QnaSection(),
                                                    QnaSection(),
                                                    QnaSection(),
                                                    QnaSection(),
                                                    QnaSection(),
                                                    QnaSection(),
                                                    QnaSection(),
                                                    QnaSection(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        CourseMoreMenu(
                          icon: Icons.edit_note_rounded,
                          title: "Notes",
                        ),
                        CourseMoreMenu(
                          icon: Icons.format_list_bulleted_rounded,
                          title: "Resources",
                        ),
                        CourseMoreMenu(
                          icon: Icons.notifications_none_rounded,
                          title: "Announcements",
                        ),
                        CourseMoreMenu(
                          icon: Icons.star_border_rounded,
                          title: "Add course to favorites",
                        ),
                        CourseMoreMenu(
                          icon: Icons.file_download_outlined,
                          title: "Archive course",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
