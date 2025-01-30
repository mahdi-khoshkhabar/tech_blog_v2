import 'package:tech_blog_v2/model/article_model.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/model/profile.dart';

class FakeData {
  List hashTagStringList = [
    "Java",
    "Web Programming",
    "Radio",
    "Flutter",
    "Figma",
    "Python",
    "C++",
  ];
  List<HashTagModel> hashTagList = [];
  List<ArticleModel> blogList = [];
  List<PodCastModel> podCastList = [
    PodCastModel(
      id: 0,
      hosts: ["Arash Kazemi"],
      guests: ["Nader Maleki (Video Game Graphic Designer)"],
      title: "Video Games: Art and Technology",
      hashTags: [
        "Video_Game",
        "Technology",
        "Digital_Art",
        "Game_Graphics",
        "Gaming"
      ],
      listenedNumber: 256,
    ),
    PodCastModel(
      id: 1,
      hosts: ["Sahar Mirzaei"],
      guests: ["Mahdi Sharifi (Full-Stack Developer)"],
      title: "Web Programming: From Beginner to Pro",
      listenedNumber: 256,
      hashTags: [
        "Programming",
        "Web_Development",
        "Full_Stack",
        "JavaScript",
        "Technology"
      ],
    ),
    PodCastModel(
      id: 2,
      hosts: ["Mohammad Ghanbari"],
      guests: ["Peyman Rafiei (Blockchain Specialist in Gaming Industry)"],
      title: "Blockchain and the Future of the Gaming Industry",
      hashTags: ["Blockchain", "Video_Game", "NFT", "Crypto", "Technology"],
      listenedNumber: 256,
    ),
    PodCastModel(
      id: 3,
      hosts: ["Maryam Fallahi"],
      guests: ["Ali Kazemi (Mobile App Developer)"],
      title: "Mobile App Development: Challenges and Opportunities",
      listenedNumber: 256,
      hashTags: [
        "Mobile_Programming",
        "Android",
        "iOS",
        "Mobile_App",
        "App_Development"
      ],
    ),
    PodCastModel(
      id: 4,
      hosts: ["Saman Norouzi"],
      guests: ["Mehrdad Hosseini (Cybersecurity Specialist)"],
      title: "Cybersecurity: Protecting Data in the Digital Age",
      listenedNumber: 256,
      hashTags: [
        "Cybersecurity",
        "Hacking",
        "Data",
        "Technology",
        "Digital_Security"
      ],
    ),
    PodCastModel(
      id: 5,
      hosts: ["Emily Johnson"],
      guests: ["Dr. Michael Davis (AI Researcher in Game Development)"],
      listenedNumber: 256,
      title: "The Future of Artificial Intelligence in Gaming",
      hashTags: [
        "ArtificialIntelligence",
        "Gaming",
        "AI",
        "Technology",
        "Future"
      ],
    ),
    PodCastModel(
      id: 6,
      hosts: ["Sarah Carter"],
      guests: ["John Martin (Blockchain Specialist in the Gaming Industry)"],
      listenedNumber: 256,
      title: "Blockchain in Gaming: The New Frontier",
      hashTags: ["Blockchain", "Gaming", "NFT", "Crypto", "Technology"],
    ),
    PodCastModel(
      id: 7,
      hosts: ["James Williams"],
      guests: ["Alex Baker (Full-Stack Developer)"],
      listenedNumber: 256,
      title: "Programming for the Web: Mastering JavaScript",
      hashTags: [
        "Programming",
        "JavaScript",
        "WebDevelopment",
        "Technology",
        "Coding"
      ],
    ),
    PodCastModel(
      id: 8,
      hosts: ["Mark Thompson"],
      guests: ["Karen Lee (Cybersecurity Expert)"],
      listenedNumber: 256,
      title: "Cybersecurity: Protecting Data in a Digital World",
      hashTags: [
        "Cybersecurity",
        "DataProtection",
        "Hacking",
        "Technology",
        "DigitalSecurity"
      ],
    ),
  ];
  List<ProfileModel> profileList = [];
  List<HashTagModel> favoriteHashTagList = [];
}
