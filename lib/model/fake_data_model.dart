import 'package:tech_blog_v2/gen/assets.gen.dart';
import 'package:tech_blog_v2/model/my_models.dart';
import 'package:tech_blog_v2/model/profile_model.dart';

class FakeData {
  List hashTagList = [
    "Java",
    "Web Programming",
    "Mahdi Khoshkhabar Radio",
    "Flutter",
    "Figma",
    "Python",
    "C++",
  ];
  List<BlogModel> blogList = [
    BlogModel(
        id: 0,
        author: "Mahdi Khosh Khabar",
        viewNumber: 253,
        blogContent: """
    Video game graphics have come a long way since the early days of 8-bit consoles. In the beginning, games like Pong 
    and Space Invaders featured simple, pixelated graphics that were groundbreaking at the time. These early games 
    laid the foundation for an industry that would grow to produce some of the most visually stunning experiences in 
    entertainment history. With each new generation of consoles and PCs, the capabilities of graphics hardware 
    have expanded, allowing developers to create increasingly realistic and immersive worlds.

    The introduction of 3D graphics in the 1990s was a major turning point. Games like Super Mario 64 and 
    The Legend of Zelda: Ocarina of Time demonstrated the potential of 3D environments, where players could explore 
    open worlds with a level of freedom and detail that was previously unimaginable. The development of powerful 
    graphics engines, such as Unreal Engine and Unity, has further pushed the boundaries of what is possible in 
    game graphics, enabling features like dynamic lighting, complex physics, and realistic character animations.

    Today, the latest trend in video game graphics is ray tracing, a technique that simulates the way light interacts 
    with objects in a scene to create highly realistic shadows, reflections, and global illumination. Ray tracing has 
    been used in movies for years, but it’s only recently become feasible for real-time applications thanks to 
    advancements in GPU technology from companies like NVIDIA and AMD. With the release of consoles like the PlayStation 5 
    and Xbox Series X, ray tracing is now accessible to a wider audience, setting a new standard for graphical fidelity in games.

    Looking ahead, the future of video game graphics is likely to involve even more advanced techniques, such as 
    real-time path tracing, AI-driven content generation, and perhaps even the use of quantum computing to simulate 
    complex environments. As technology continues to evolve, so too will the visual experiences that games can offer, 
    further blurring the line between the virtual and the real.
    """,
        hashTags: ["Video Game", "Ray Tracing"],
        title:
            "The Evolution of Video Game Graphics: From Pixels to Ray Tracing",
        poster: Assets.images.posterTest.image()),
    BlogModel(
      id: 1,
      author: "Melika Azizi",
      viewNumber: 243,
      blogContent: """
    Python has become one of the most popular programming languages in the world, and for good reason. Its simplicity, 
    versatility, and extensive libraries make it an ideal choice for both beginners and experienced developers. 
    Whether you’re interested in web development, data science, artificial intelligence, or automation, Python has 
    the tools you need to get the job done.

    One of the key reasons for Python's popularity is its readability. Python’s syntax is designed to be easy to understand, 
    which makes it a great language for beginners. Unlike languages like C++ or Java, Python doesn’t require you to write 
    complex code just to accomplish simple tasks. This simplicity allows developers to focus more on solving problems 
    and less on dealing with the intricacies of the language itself.

    Another factor contributing to Python’s success is its vast ecosystem of libraries and frameworks. For web development, 
    frameworks like Django and Flask allow developers to build powerful applications quickly and efficiently. In the field 
    of data science, libraries like NumPy, pandas, and Matplotlib provide the tools needed to analyze and visualize data. 
    For AI and machine learning, TensorFlow and PyTorch are among the most popular libraries, enabling the development 
    of cutting-edge models and algorithms.

    Python is also a cross-platform language, meaning that code written in Python can run on various operating systems, 
    including Windows, macOS, and Linux, without modification. This makes it a versatile choice for developers who need 
    to deploy their applications across different environments.

    As Python continues to grow in popularity, its community of developers and contributors has also expanded. This vibrant 
    community provides extensive documentation, tutorials, and support, making it easier for newcomers to learn the language 
    and for experienced developers to find solutions to complex problems. Python's open-source nature also means that it is 
    constantly evolving, with new features and improvements being added regularly.

    In conclusion, Python’s combination of readability, versatility, and a strong ecosystem makes it an excellent choice 
    for a wide range of programming tasks. Whether you're just starting your coding journey or you're a seasoned developer 
    looking to expand your toolkit, Python has something to offer.
    """,
      hashTags: ["Python", "پایتون", "برنامه نویسی", "Programming"],
      title:
          "Introduction to Python: Why It’s the Most Popular Programming Language",
    ),
    BlogModel(
      id: 2,
      author: "Fateme Amiri",
      viewNumber: 210,
      blogContent: """
    Robotics is no longer a concept confined to science fiction; it’s a rapidly growing field that is transforming industries 
    around the world. From manufacturing to healthcare, robots are being used to perform tasks with precision, efficiency, 
    and consistency that surpass human capabilities. As technology continues to advance, the role of robots in our daily 
    lives and workplaces is set to expand even further.

    In the manufacturing sector, robots have been a game-changer. Industrial robots are used in assembly lines to perform 
    repetitive tasks such as welding, painting, and packaging with high accuracy and speed. This not only increases productivity 
    but also reduces the risk of human error, leading to higher quality products. Moreover, robots can operate in hazardous 
    environments, handling tasks that would be dangerous for humans, such as working with toxic chemicals or in extreme 
    temperatures.

    Healthcare is another industry where robotics is making significant strides. Surgical robots, such as the Da Vinci system, 
    allow surgeons to perform minimally invasive procedures with greater precision and control than traditional methods. 
    These robots are equipped with high-definition cameras and instruments that can be maneuvered in tight spaces, reducing 
    the risk of complications and speeding up recovery times for patients. In addition, robots are being used in rehabilitation 
    to help patients regain mobility and strength through targeted exercises.

    The rise of robotics is also being felt in the logistics and supply chain industry. Autonomous robots are being used 
    in warehouses to pick, pack, and sort items with incredible efficiency. These robots use advanced sensors and AI to 
    navigate their environment and perform tasks with minimal human intervention. As e-commerce continues to grow, 
    the demand for these robotic solutions is expected to increase, leading to faster delivery times and lower costs 
    for consumers.

    Despite the many benefits of robotics, there are also challenges to consider. The integration of robots into the workforce 
    raises questions about job displacement and the need for retraining workers to adapt to new roles. Additionally, the 
    development of more advanced robots, particularly those with AI capabilities, presents ethical concerns about autonomy 
    and decision-making.

    In conclusion, robotics is poised to revolutionize various industries by enhancing productivity, improving safety, 
    and enabling new possibilities in healthcare, manufacturing, and logistics. As the technology continues to evolve, 
    it will be essential to address the challenges and ensure that the benefits of robotics are shared widely across society.
    """,
      hashTags: ["Robot", "Industry"],
      title: "The Rise of Robotics: How Robots Are Transforming Industries",
    ),
    BlogModel(
      id: 3,
      author: "Ashkan Ebtekari",
      viewNumber: 148,
      blogContent: """
    In today’s interconnected world, cybersecurity has become more important than ever. With the increasing reliance on 
    digital devices and online services, the risk of cyber attacks has grown exponentially. From personal data breaches 
    to large-scale corporate hacks, the consequences of poor cybersecurity can be devastating. This blog explores the 
    current state of cybersecurity, common threats, and best practices for protecting your digital life.

    One of the most common cybersecurity threats is phishing, where attackers attempt to trick individuals into revealing 
    sensitive information, such as passwords or credit card numbers, by pretending to be a legitimate entity. These attacks 
    are often carried out through email or messaging platforms and can be difficult to detect. To protect yourself, it’s 
    crucial to be vigilant and verify the authenticity of any communication that requests personal information.

    Another significant threat is malware, which includes viruses, ransomware, and spyware. Malware can infect your devices 
    through malicious downloads, email attachments, or compromised websites. Once installed, malware can steal your data, 
    monitor your activities, or even lock you out of your system until a ransom is paid. To prevent malware infections, 
    always use reputable antivirus software, keep your operating system and applications up to date, and avoid downloading 
    files from untrusted sources.

    The rise of the Internet of Things (IoT) has also introduced new cybersecurity challenges. IoT devices, such as smart 
    home appliances and wearable technology, often have weaker security measures compared to traditional computers and 
    smartphones. These devices can be targeted by attackers to gain access to your home network or collect sensitive 
    data. To secure your IoT devices, change default passwords, disable unnecessary features, and regularly update the 
    device firmware.

    Social engineering attacks are another method used by cybercriminals to manipulate individuals into divulging confidential 
    information or performing actions that compromise security. These attacks exploit human psychology rather than technical 
    vulnerabilities, making them particularly effective. Examples include pretexting, where the attacker pretends to be 
    someone trustworthy, and baiting, where the attacker offers something enticing to lure the victim into a trap. Awareness 
    and education are key to defending against social engineering attacks.

    In the corporate world, cybersecurity is a top priority, as data breaches can result in significant financial losses 
    and damage to a company’s reputation. Organizations are investing in advanced security measures, such as encryption, 
    multi-factor authentication, and intrusion detection systems, to protect their assets. However, cybersecurity is not 
    just the responsibility of IT departments; employees at all levels must be trained in best practices to recognize and respond to potential threats. Regular security audits and simulations 
    can help organizations identify vulnerabilities and improve their defenses against cyber attacks.

    Cybersecurity is an ever-evolving field, as attackers continually develop new methods to breach systems and steal data. 
    Staying informed about the latest threats and implementing strong security measures is essential for protecting your 
    digital life. By being proactive and vigilant, both individuals and organizations can reduce the risk of cyber attacks 
    and safeguard their information in the digital age.
    """,
      hashTags: [
        "امنیت سایبری",
      ],
      title: "Cybersecurity in the Modern World: Protecting Your Digital Life",
    ),
    BlogModel(
      id: 4,
      author: "Parsa Rahmani",
      viewNumber: 136,
      blogContent: """
    Artificial Intelligence (AI) is revolutionizing the healthcare industry by providing innovative solutions that improve 
    patient outcomes, enhance diagnostic accuracy, and streamline administrative processes. AI's ability to analyze vast 
    amounts of data and identify patterns that might be missed by human professionals is leading to a new era of personalized 
    medicine and more efficient healthcare systems.

    One of the most promising applications of AI in healthcare is in medical imaging. AI algorithms can analyze medical 
    images, such as X-rays, MRIs, and CT scans, with a level of precision that rivals and sometimes surpasses that of 
    experienced radiologists. By identifying subtle anomalies and patterns, AI can assist doctors in diagnosing conditions 
    like cancer, cardiovascular diseases, and neurological disorders at earlier stages, when treatment is more likely to 
    be successful.

    AI is also making strides in drug discovery and development. Traditional drug discovery processes are time-consuming 
    and expensive, often taking years and billions of dollars to bring a new drug to market. AI can accelerate this process 
    by predicting how different compounds will interact with specific targets in the body, thereby identifying potential 
    drug candidates more quickly. Additionally, AI can help design clinical trials more efficiently, ensuring that they 
    are better targeted and more likely to yield meaningful results.

    In the realm of personalized medicine, AI is enabling the development of treatment plans that are tailored to the 
    individual characteristics of each patient. By analyzing genetic information, lifestyle factors, and medical history, 
    AI can help doctors create customized therapies that are more effective and have fewer side effects. This approach is 
    particularly beneficial in the treatment of complex diseases, such as cancer, where standard treatments may not be 
    equally effective for all patients.

    AI is also transforming healthcare administration by automating routine tasks, such as scheduling appointments, 
    managing patient records, and processing insurance claims. This reduces the administrative burden on healthcare 
    providers, allowing them to focus more on patient care. Moreover, AI-powered chatbots and virtual assistants are 
    being used to provide patients with information, answer questions, and guide them through their treatment plans, 
    improving patient engagement and satisfaction.

    However, the integration of AI in healthcare also raises important ethical and regulatory questions. Ensuring that 
    AI systems are transparent, fair, and free from bias is critical, as is protecting patient privacy and data security. 
    Healthcare professionals must also be adequately trained to work with AI tools and interpret their outputs accurately.

    In conclusion, AI has the potential to transform healthcare by improving diagnosis, treatment, and administration. 
    As the technology continues to evolve, it will be essential to address the challenges and ensure that AI is used 
    responsibly to benefit patients and healthcare providers alike.
    """,
      hashTags: [
        "AI",
        "Artificial Intelligence",
        "هوش مصنوعی",
        "Healthcare",
        "مراقبت های بهداشتی"
      ],
      title: "Artificial Intelligence in Healthcare: Transforming Patient Care",
    ),
    BlogModel(
      id: 5,
      author: "Saba Teymuri",
      viewNumber: 114,
      blogContent: """
    Quantum computing is poised to revolutionize the world of technology by solving problems that are currently beyond the 
    reach of classical computers. Unlike classical computers, which process information in binary bits (0s and 1s), quantum 
    computers use quantum bits, or qubits, which can represent both 0 and 1 simultaneously thanks to the principles of 
    superposition and entanglement. This allows quantum computers to perform complex calculations at unprecedented speeds, 
    opening up new possibilities in fields ranging from cryptography to material science.

    One of the most exciting potential applications of quantum computing is in the field of cryptography. Many of the encryption 
    methods that protect our digital communications today rely on the difficulty of factoring large numbers, a task that is 
    computationally expensive for classical computers. However, quantum computers, with their ability to perform parallel 
    computations, could break these encryption methods in a fraction of the time, rendering current cryptographic techniques 
    obsolete. This has led to the development of quantum-resistant algorithms, which are designed to withstand the power of 
    quantum attacks.

    Quantum computing also holds great promise for solving optimization problems that are intractable for classical computers. 
    These problems, which involve finding the best solution from a vast number of possibilities, are common in industries 
    such as logistics, finance, and manufacturing. For example, a quantum computer could optimize supply chains, financial 
    portfolios, or even traffic flow in a city more efficiently than any classical computer, leading to significant cost savings 
    and improved outcomes.

    In the field of material science, quantum computing could accelerate the discovery of new materials with desirable properties, 
    such as superconductors or catalysts for chemical reactions. By simulating the quantum behavior of atoms and molecules, 
    quantum computers can provide insights that are impossible to obtain with classical simulations. This could lead to 
    breakthroughs in areas such as energy storage, drug discovery, and environmental sustainability.

    Despite its potential, quantum computing is still in its infancy, with many technical challenges to overcome before it 
    can be widely adopted. Qubits are extremely fragile and prone to errors due to environmental disturbances, a phenomenon 
    known as decoherence. Researchers are working on developing error-correcting codes and more stable qubits to improve 
    the reliability of quantum computations. Additionally, building scalable quantum computers that can outperform classical 
    supercomputers remains a significant engineering challenge.

    As quantum computing technology continues to advance, it is likely to have a profound impact on many areas of science 
    and technology. Governments and companies around the world are investing heavily in quantum research, recognizing its 
    potential to drive innovation and maintain a competitive edge. While widespread practical applications may still be years 
    away, the race to build the first fully functional quantum computer is well underway.

    In conclusion, quantum computing represents a new frontier in computing technology, with the potential to solve problems 
    that are currently unsolvable. As research progresses, we may see quantum computers becoming an integral part of the 
    technological landscape, unlocking new possibilities and transforming industries in ways we can only begin to imagine.
    """,
      hashTags: [
        "Quantum Computing",
        "محاسبات کوانتومی",
        "Quantum",
        "Computing"
      ],
      title: "The Future of Quantum Computing: Unlocking New Possibilities",
    ),
    BlogModel(
      id: 6,
      author: "Abbas Khodayari",
      viewNumber: 97,
      blogContent: """
    Big Data is transforming the business landscape by providing companies with unprecedented insights into customer behavior, 
    market trends, and operational efficiency. The ability to analyze massive amounts of data in real time allows businesses 
    to make more informed decisions, improve customer experiences, and gain a competitive edge. In this blog, we will explore 
    the role of Big Data in shaping the future of business and the opportunities it presents for organizations across various 
    industries.

    One of the most significant impacts of Big Data is on customer experience. By analyzing data from various sources, such as 
    social media, online transactions, and customer feedback, companies can gain a deeper understanding of their customers' 
    preferences and needs. This allows them to personalize their products, services, and marketing strategies to better meet 
    those needs, resulting in increased customer satisfaction and loyalty. For example, e-commerce companies use Big Data 
    analytics to recommend products based on a customer's browsing and purchase history, creating a more personalized shopping 
    experience.

    Big Data is also revolutionizing supply chain management by providing real-time visibility into every aspect of the supply 
    chain, from raw material sourcing to final product delivery. This enables companies to optimize inventory levels, reduce 
    waste, and respond more quickly to changes in demand. For example, sensors and IoT devices can track the location and 
    condition of goods in transit, allowing companies to monitor their supply chains in real time and make adjustments as 
    needed to avoid disruptions.

    In the financial industry, Big Data is being used to detect fraudulent transactions, assess credit risk, and optimize 
    investment portfolios. By analyzing transaction data and customer behavior patterns, financial institutions can identify 
    unusual activities that may indicate fraud and take preventive measures before significant losses occur. Additionally, 
    Big Data analytics can help banks and lenders make more accurate credit decisions by evaluating a broader range of factors 
    beyond traditional credit scores.

    Healthcare is another industry where Big Data is having a profound impact. By analyzing patient data, healthcare providers 
    can identify patterns and trends that can lead to more effective treatments and better patient outcomes. For example, 
    predictive analytics can help identify patients at risk of developing chronic conditions, allowing for earlier interventions 
    and potentially reducing healthcare costs. Big Data is also being used to improve the efficiency of clinical trials by 
    identifying the most promising candidates for new treatments.

    However, the widespread use of Big Data also raises important ethical and privacy concerns. The collection and analysis of 
    vast amounts of personal data require robust data protection measures to prevent misuse and ensure that individuals' privacy 
    is respected. Organizations must also be transparent about how they use data and provide customers with control over their 
    personal information.

    In conclusion, Big Data is playing a crucial role in shaping the future of business by enabling companies to make more 
    informed decisions, improve customer experiences, and optimize their operations. As the volume of data continues to grow, 
    the ability to harness its power will be a key differentiator for businesses across all industries. However, it is essential 
    to address the ethical and privacy challenges associated with Big Data to ensure that its benefits are realized in a 
    responsible and sustainable manner.
    """,
      hashTags: ["Big Data", "Business"],
      title: "The Role of Big Data in Shaping the Future of Business",
    ),
    BlogModel(
      id: 7,
      author: "Yunes Abdellahian",
      viewNumber: 58,
      blogContent: """
    The rollout of 5G technology is set to revolutionize the way we communicate by providing faster, more reliable connections 
    with lower latency. 5G, the fifth generation of wireless technology, offers significant improvements over its predecessor, 
    4G, in terms of speed, capacity, and responsiveness. This next-generation network is expected to have a profound impact 
    on various industries, from telecommunications to healthcare, and pave the way for new innovations and applications.

    One of the most notable benefits of 5G is its ability to deliver faster data speeds, with peak rates potentially reaching 
    up to 10 Gbps. This means that users can download large files, stream high-definition videos, and play online games with 
    minimal lag, all while connected to a single network. The increased speed and capacity of 5G will also support the growing 
    number of connected devices, enabling the Internet of Things (IoT) to reach its full potential. With 5G, smart cities, 
    autonomous vehicles, and remote healthcare will become more viable, as the network can handle the massive amount of data 
    generated by these applications.

    In addition to speed, 5G offers significantly lower latency, reducing the time it takes for data to travel between devices 
    and the network. This is particularly important for applications that require real-time communication, such as virtual 
    reality (VR), augmented reality (AR), and telemedicine. For example, in a healthcare setting, a surgeon could perform 
    a remote operation using robotic instruments with precise control and minimal delay, thanks to the low latency of 5G.

    The impact of 5G on the telecommunications industry will be transformative. As network operators deploy 5G infrastructure, 
    they will be able to offer new services and business models that were not possible with previous generations of wireless 
    technology. For instance, 5G will enable the development of private networks for enterprises, providing secure and 
    reliable connectivity for critical applications such as industrial automation and smart manufacturing. This could lead 
    to increased productivity and efficiency across various sectors.

    The entertainment industry is also expected to benefit from 5G, with the potential for new immersive experiences in gaming, 
    live events, and media consumption. With 5G, users will be able to enjoy seamless streaming of high-definition content, 
    participate in multi-player online games with minimal lag, and experience VR and AR in a more realistic and interactive way.

    However, the deployment of 5G is not without its challenges. Building the necessary infrastructure, including small cells, 
    antennas, and fiber optic cables, requires significant investment and time. Additionally, there are concerns about the 
    potential health effects of increased exposure to electromagnetic fields (EMFs) from 5G networks, although scientific 
    evidence on this issue is still inconclusive. Regulatory and security challenges also need to be addressed, particularly 
    in terms of ensuring that 5G networks are secure from cyber threats.

    In conclusion, 5G technology has the potential to transform communication and enable a wide range of new applications 
    and services. Its impact will be felt across various industries, from healthcare to entertainment, and will likely 
    drive innovation in ways we have yet to fully imagine. As 5G networks continue to roll out globally, it will be essential 
    to address the challenges and ensure that the benefits of this technology are realized in a safe and equitable manner.
    """,
      hashTags: ["Internet", "5G"],
      title: "The Impact of 5G Technology on the Future of Communication",
    ),
    BlogModel(
      id: 8,
      author: "Sheida Jamshidi",
      viewNumber: 43,
      blogContent: """
    Indie video games have become a significant force in the gaming industry, offering unique and innovative experiences 
    that often push the boundaries of what is possible in mainstream gaming. Unlike games produced by large studios, 
    indie games are typically developed by small teams or even individual creators, allowing for greater creative freedom 
    and experimentation. This has led to the creation of some of the most memorable and critically acclaimed games in recent 
    years, showcasing the diverse talents and visions of indie developers.

    One of the defining characteristics of indie games is their emphasis on creativity and innovation. Without the pressure 
    to appeal to a mass market or conform to industry trends, indie developers are free to explore unconventional ideas and 
    experiment with new gameplay mechanics, art styles, and storytelling techniques. This has resulted in a wide variety of 
    indie games that offer fresh and original experiences, from the minimalist puzzle-solving of "Limbo" to the emotionally 
    charged narrative of "Celeste."

    The rise of digital distribution platforms, such as Steam, itch.io, and the Epic Games Store, has played a crucial role 
    in the success of indie games. These platforms provide indie developers with the opportunity to reach a global audience 
    without the need for a traditional publisher, making it easier for them to bring their games to market. Crowdfunding 
    platforms like Kickstarter have also enabled indie developers to raise funds directly from players who are passionate 
    about their projects, further democratizing the game development process.

    Indie games are also known for their strong focus on storytelling and character development. Many indie developers use 
    their games as a medium to explore personal and social themes that may not be addressed in mainstream games. For example, 
    "Undertale" challenges traditional RPG conventions by allowing players to choose non-violent solutions to conflicts, 
    while "Night in the Woods" tackles issues such as mental health, economic hardship, and the struggles of young adulthood. 
    These games resonate with players who are looking for more than just entertainment, offering meaningful and thought-provoking 
    experiences.

    The impact of indie games extends beyond their immediate success; they have also influenced the broader gaming industry. 
    Many mainstream developers and publishers have taken note of the innovative ideas and gameplay mechanics pioneered by 
    indie games, leading to their incorporation into larger, more commercially focused titles. Additionally, the success 
    of indie games has inspired a new generation of developers to pursue their creative passions, contributing to the 
    continued growth and diversity of the gaming industry.

    In conclusion, indie video games represent a vital and vibrant part of the gaming landscape, offering players unique 
    experiences that challenge the norms of mainstream gaming. With their focus on creativity, storytelling, and innovation, 
    indie games have earned their place in the hearts of gamers and continue to push the boundaries of what games can be. 
    As the indie game community continues to grow, we can expect to see even more exciting and groundbreaking titles that 
    showcase the limitless potential of this creative medium.
    """,
      hashTags: ["Video Game", "Indie"],
      title: "Exploring the World of Indie Video Games: Creativity Unleashed",
    ),
  ];
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
  List<ProfileModel> profileList = [
    ProfileModel(
      name: "Mahdi",
      lastName: "Khoshkhabar",
      emailAddress: "mahdikhoshkhabar6@gmail.com",
    ),
  ];
}
