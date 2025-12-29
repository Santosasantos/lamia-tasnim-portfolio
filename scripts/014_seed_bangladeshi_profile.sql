-- Clear existing data first
DELETE FROM certifications;
DELETE FROM scholarly_activities;
DELETE FROM volunteering;
DELETE FROM awards;
DELETE FROM skills;
DELETE FROM publications;
DELETE FROM experiences;
DELETE FROM education;
DELETE FROM profiles;

-- Insert profile data for Rifat Ahmed (Random Bangladeshi Person)
-- NOTE: Profile image should be uploaded to Supabase Storage 'profile-images' bucket
-- Recommended: Use a realistic photo of a Bangladeshi male professional
-- After uploading, update the profile_image URL using: UPDATE profiles SET profile_image = 'your-storage-url' WHERE full_name = 'Rifat Ahmed';
INSERT INTO profiles (full_name, title, bio, email, phone, address, profile_image, linkedin_url, facebook_url, github_url)
VALUES (
  'Rifat Ahmed',
  'Software Engineer & Research Enthusiast | Full Stack Developer',
  'I am a passionate Software Engineer and Research Enthusiast with expertise in full-stack development, machine learning, and data science. My research interests include artificial intelligence applications in healthcare, fintech solutions for emerging markets, and sustainable technology development. I am committed to leveraging technology to solve real-world problems and contribute to Bangladesh''s digital transformation. With a strong foundation in computer science and hands-on experience in developing scalable applications, I aim to bridge the gap between academic research and industry implementation.',
  'rifat.ahmed.bd@gmail.com',
  '+880 1712-345678',
  'House 45, Road 12, Dhanmondi, Dhaka-1209, Bangladesh',
  '/placeholder-user.jpg',
  'https://linkedin.com/in/rifat-ahmed-bd',
  'https://facebook.com/rifat.ahmed.bd',
  'https://github.com/rifat-ahmed-bd'
);

-- Insert education data
INSERT INTO education (institution, degree, field_of_study, start_date, end_date, cgpa, location, achievements, status, display_order)
VALUES 
(
  'Bangladesh University of Engineering and Technology (BUET)',
  'Bachelor of Science in Computer Science and Engineering',
  'Computer Science and Engineering',
  'Jan 2019',
  'Dec 2023',
  'CGPA: 3.85/4.00 (First Class with Distinction)',
  'Dhaka, Bangladesh',
  'Thesis: "AI-Powered Healthcare Diagnosis System for Rural Bangladesh", Dean''s List (4 semesters), Winner of BUET Programming Contest 2022, Member of BUET Computer Club',
  'Completed',
  1
),
(
  'Notre Dame College, Dhaka',
  'Higher Secondary Certificate (HSC)',
  'Science',
  'Jul 2016',
  'Jul 2018',
  'GPA 5.00/5.00',
  'Dhaka, Bangladesh',
  'Achieved perfect GPA, Active member of Science Club',
  'Completed',
  2
),
(
  'Motijheel Ideal School and College',
  'Secondary School Certificate (SSC)',
  'Science',
  'Jan 2014',
  'May 2016',
  'GPA 5.00/5.00',
  'Dhaka, Bangladesh',
  'Achieved perfect GPA, Participated in Science Fair',
  'Completed',
  3
);

-- Insert professional experiences
INSERT INTO experiences (position, organization, project_name, start_date, end_date, location, employment_type, description, responsibilities, category, display_order)
VALUES
(
  'Senior Software Engineer',
  'bKash Limited',
  'Digital Payment Platform Enhancement',
  'Mar 2024',
  'Present',
  'Gulshan, Dhaka',
  'Full Time',
  'Leading development of microservices architecture for digital payment solutions serving millions of users across Bangladesh.',
  ARRAY[
    'Designed and implemented scalable microservices using Node.js, Express, and PostgreSQL',
    'Developed RESTful APIs handling 10M+ daily transactions with 99.9% uptime',
    'Led a team of 5 junior developers, conducting code reviews and mentoring sessions',
    'Implemented real-time fraud detection system using machine learning algorithms',
    'Optimized database queries reducing response time by 40%',
    'Collaborated with cross-functional teams including product, design, and QA'
  ],
  'Industry',
  1
),
(
  'Research Assistant',
  'Institute of Information Technology, University of Dhaka',
  'AI-Based Disease Prediction System for Rural Healthcare',
  'Jun 2023',
  'Dec 2023',
  'Dhaka, Bangladesh',
  'Part Time',
  'Developed machine learning models to predict common diseases in rural Bangladesh using patient symptoms and medical history.',
  ARRAY[
    'Collected and preprocessed medical data from 5000+ patients across 10 rural health centers',
    'Developed ensemble models (Random Forest, XGBoost) achieving 87% accuracy in disease prediction',
    'Created web application using React and Flask for healthcare workers to input patient data',
    'Published research findings in IEEE Conference on Healthcare Informatics',
    'Collaborated with medical professionals to validate model predictions'
  ],
  'Research',
  2
),
(
  'Full Stack Developer Intern',
  'Grameenphone Ltd.',
  'Customer Portal Development',
  'Jan 2023',
  'Mar 2023',
  'Gulshan, Dhaka',
  'Full Time',
  'Developed customer-facing web portal for managing mobile services, bill payments, and data packages.',
  ARRAY[
    'Built responsive frontend using React.js and Material-UI',
    'Developed backend APIs using Node.js and MongoDB',
    'Integrated payment gateway for online bill payments',
    'Implemented user authentication and authorization',
    'Wrote unit tests achieving 85% code coverage'
  ],
  'Industry',
  3
),
(
  'Teaching Assistant',
  'Department of CSE, BUET',
  'Data Structures and Algorithms Course',
  'Jan 2022',
  'Dec 2023',
  'Dhaka, Bangladesh',
  'Part Time',
  'Assisted professors in teaching data structures and algorithms to 200+ undergraduate students.',
  ARRAY[
    'Conducted weekly lab sessions and problem-solving workshops',
    'Graded assignments and provided detailed feedback to students',
    'Created supplementary learning materials and coding examples',
    'Helped students prepare for competitive programming contests',
    'Maintained course website and online resources'
  ],
  'Research',
  4
),
(
  'Freelance Web Developer',
  'Self-Employed',
  'E-commerce Platform Development',
  'Jun 2021',
  'Present',
  'Remote',
  'Part Time',
  'Developed custom e-commerce solutions for small and medium businesses in Bangladesh.',
  ARRAY[
    'Built 15+ e-commerce websites using React, Node.js, and PostgreSQL',
    'Integrated payment gateways (bKash, Nagad, Rocket)',
    'Implemented inventory management and order tracking systems',
    'Optimized websites for mobile devices and slow internet connections',
    'Provided ongoing maintenance and support to clients'
  ],
  'Industry',
  5
);

-- Insert publications
INSERT INTO publications (title, authors, journal, publication_date, status, category, keywords, abstract, url, academic_pdf, citation_count, conference_title, conference_organizer, location, conference_images, conference_paper_pdf, conference_videos, display_order)
VALUES
(
  'AI-Powered Disease Prediction System for Rural Healthcare in Bangladesh: A Machine Learning Approach',
  'Rifat Ahmed, Dr. Mohammad Hasan, Dr. Fatima Rahman, Ayesha Khan',
  'IEEE Conference on Healthcare Informatics (ICHI)',
  'Sep 2024',
  'Published',
  'Conference Publication',
  ARRAY['Machine Learning', 'Healthcare', 'Rural Bangladesh', 'Disease Prediction', 'AI'],
  'This paper presents a machine learning-based system for predicting common diseases in rural Bangladesh where access to medical professionals is limited. Using data from 5000+ patients across 10 rural health centers, we developed ensemble models achieving 87% accuracy. The system helps healthcare workers make preliminary diagnoses and prioritize patient care, potentially saving lives in remote areas.',
  'https://ieeexplore.ieee.org/document/example',
  NULL,
  12,
  'IEEE Conference on Healthcare Informatics 2024',
  'IEEE Computer Society',
  'Dhaka, Bangladesh',
  ARRAY[
    'https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?w=800',
    'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=800',
    'https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=800'
  ],
  'https://storage.googleapis.com/example-bucket/conference-papers/ai-healthcare-bangladesh.pdf',
  ARRAY[
    'https://storage.googleapis.com/example-bucket/conference-videos/ai-healthcare-presentation.mp4'
  ],
  1
),
(
  'Fintech Solutions for Financial Inclusion in Bangladesh: A Case Study of Mobile Banking',
  'Rifat Ahmed, Dr. Karim Uddin',
  'Journal of Financial Technology and Innovation',
  'Nov 2024',
  'Published',
  'Academic Publication',
  ARRAY['Fintech', 'Financial Inclusion', 'Mobile Banking', 'Bangladesh', 'Digital Finance'],
  'This study examines the impact of mobile banking services on financial inclusion in Bangladesh, focusing on bKash, Nagad, and Rocket. Through analysis of transaction data and user surveys, we demonstrate how these platforms have increased financial access for 50+ million previously unbanked individuals, contributing to economic growth and poverty reduction.',
  'https://journals.example.com/fintech-bangladesh',
  'https://storage.googleapis.com/example-bucket/academic-pdfs/fintech-bangladesh.pdf',
  8,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  2
),
(
  'Sustainable Software Development Practices in Emerging Markets',
  'Rifat Ahmed',
  'Tech Bangladesh Weekly',
  'Aug 15, 2024',
  'Published',
  'Non-Academic Publication',
  ARRAY['Software Development', 'Sustainability', 'Emerging Markets', 'Best Practices'],
  'Exploring sustainable software development practices tailored for emerging markets like Bangladesh, focusing on resource optimization, energy efficiency, and long-term maintainability.',
  'https://techbangladesh.com/articles/sustainable-software',
  NULL,
  0,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  3
),
(
  'Machine Learning Applications in Agriculture: Optimizing Crop Yield Prediction',
  'Rifat Ahmed, Dr. Hasan Mahmud, Priya Das',
  'International Conference on AI and Agriculture',
  'Jun 2024',
  'Published',
  'Conference Publication',
  ARRAY['Machine Learning', 'Agriculture', 'Crop Prediction', 'Bangladesh'],
  'We developed a machine learning model to predict crop yields in Bangladesh using weather data, soil conditions, and historical yield data. The model helps farmers make informed decisions about planting and resource allocation.',
  'https://conference.example.com/ai-agriculture',
  NULL,
  5,
  'International Conference on AI and Agriculture 2024',
  'Agricultural University, Mymensingh',
  'Mymensingh, Bangladesh',
  ARRAY[
    'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=800',
    'https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=800'
  ],
  'https://storage.googleapis.com/example-bucket/conference-papers/ml-agriculture.pdf',
  ARRAY[
    'https://storage.googleapis.com/example-bucket/conference-videos/ml-agriculture-presentation.mp4'
  ],
  4
),
(
  'Blockchain-Based Supply Chain Transparency for Garment Industry in Bangladesh',
  'Rifat Ahmed, Dr. Nusrat Jahan, Tanvir Rahman',
  'Asian Journal of Information Technology',
  NULL,
  'Under Review',
  'Academic Publication',
  ARRAY['Blockchain', 'Supply Chain', 'Garment Industry', 'Transparency', 'Bangladesh'],
  'This research proposes a blockchain-based solution to enhance transparency and traceability in Bangladesh''s garment supply chain, addressing concerns about labor conditions and environmental impact.',
  NULL,
  NULL,
  0,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  5
);

-- Insert skills
INSERT INTO skills (name, category, proficiency, display_order)
VALUES
('JavaScript', 'Technical', 'Expert', 1),
('TypeScript', 'Technical', 'Expert', 2),
('React.js', 'Technical', 'Expert', 3),
('Node.js', 'Technical', 'Expert', 4),
('Python', 'Technical', 'Advanced', 5),
('Machine Learning', 'Technical', 'Advanced', 6),
('PostgreSQL', 'Technical', 'Advanced', 7),
('MongoDB', 'Technical', 'Advanced', 8),
('Docker', 'Technical', 'Intermediate', 9),
('AWS', 'Technical', 'Intermediate', 10),
('Git', 'Technical', 'Expert', 11),
('Problem Solving', 'Interpersonal', 'Expert', 12),
('Team Leadership', 'Interpersonal', 'Advanced', 13),
('Communication', 'Interpersonal', 'Expert', 14),
('Bengali', 'Languages', 'Native', 15),
('English', 'Languages', 'Fluent', 16);
-- Note: Language names must match the languageFlags mapping in the code
-- Bengali -> 🇧🇩, English -> 🇬🇧

-- Insert awards
INSERT INTO awards (title, issuer, date, description, image, display_order)
VALUES
(
  'Best Paper Award',
  'IEEE Conference on Healthcare Informatics 2024',
  'Sep 2024',
  'Received Best Paper Award for research on AI-powered disease prediction system for rural healthcare in Bangladesh',
  'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
  1
),
(
  'Champion',
  'BUET Programming Contest 2022',
  'Nov 2022',
  'Won first place in university-wide programming contest solving complex algorithmic problems',
  'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800',
  2
),
(
  'Dean''s List',
  'Bangladesh University of Engineering and Technology',
  '2022, 2023',
  'Achieved Dean''s List recognition for academic excellence in four consecutive semesters',
  'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800',
  3
),
(
  'Outstanding Intern Award',
  'Grameenphone Ltd.',
  'Mar 2023',
  'Recognized for exceptional performance and contribution during internship program',
  'https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800',
  4
);

-- Insert volunteering activities
INSERT INTO volunteering (role, organization, start_date, end_date, description, display_order)
VALUES
(
  'Tech Mentor',
  'Code for Bangladesh',
  'Jan 2023',
  'Present',
  'Mentoring underprivileged students in programming and software development, conducting weekly coding workshops',
  1
),
(
  'Volunteer Developer',
  'Digital Bangladesh Foundation',
  'Jun 2022',
  'Present',
  'Developing free educational websites and mobile apps for rural students, helping bridge the digital divide',
  2
),
(
  'Organizer',
  'BUET Tech Fest 2023',
  'Mar 2023',
  'Mar 2023',
  'Organized annual technology festival with 500+ participants, including hackathons, workshops, and tech talks',
  3
),
(
  'Teaching Volunteer',
  'Rural Education Initiative',
  'Jan 2022',
  'Dec 2023',
  'Taught basic computer skills and programming to 100+ students in rural schools across Bangladesh',
  4
),
(
  'Open Source Contributor',
  'GitHub Community',
  'Jan 2021',
  'Present',
  'Contributing to open-source projects, maintaining repositories, and helping developers worldwide',
  5
);

-- Insert scholarly activities
INSERT INTO scholarly_activities (title, type, organization, date, description, display_order)
VALUES
(
  'IEEE Conference on Healthcare Informatics 2024',
  'Conference Presentation',
  'IEEE Computer Society',
  'Sep 15-17, 2024',
  'Presented research paper on AI-powered disease prediction system for rural healthcare in Bangladesh',
  1
),
(
  'International Conference on AI and Agriculture 2024',
  'Conference Presentation',
  'Agricultural University, Mymensingh',
  'Jun 10-12, 2024',
  'Presented research on machine learning applications in agriculture for crop yield prediction',
  2
),
(
  'Tech Talk: Building Scalable Web Applications',
  'Workshop',
  'BUET Computer Club',
  'Oct 2023',
  'Conducted workshop on building scalable web applications using modern technologies',
  3
),
(
  'Hackathon Judge',
  'Judging',
  'National ICT Innovation Fair 2024',
  'Nov 2024',
  'Served as judge for national-level hackathon evaluating innovative tech solutions',
  4
),
(
  'Research Symposium Organizer',
  'Organizing',
  'BUET CSE Department',
  'Dec 2023',
  'Organized annual research symposium showcasing student and faculty research projects',
  5
);

-- Insert certifications
INSERT INTO certifications (name, issuer, issue_date, credential_url, display_order)
VALUES
(
  'AWS Certified Solutions Architect - Associate',
  'Amazon Web Services',
  '2024',
  'https://www.credly.com/badges/example',
  1
),
(
  'Machine Learning Specialization',
  'Stanford University (Coursera)',
  '2023',
  'https://coursera.org/verify/example1',
  2
),
(
  'Full Stack Web Development',
  'freeCodeCamp',
  '2023',
  'https://freecodecamp.org/certification/example',
  3
),
(
  'Deep Learning Specialization',
  'DeepLearning.AI (Coursera)',
  '2023',
  'https://coursera.org/verify/example2',
  4
),
(
  'Docker and Kubernetes',
  'Linux Foundation',
  '2024',
  'https://training.linuxfoundation.org/certification/example',
  5
),
(
  'React Advanced Patterns',
  'Frontend Masters',
  '2024',
  'https://frontendmasters.com/certificates/example',
  6
),
(
  'MongoDB Certified Developer',
  'MongoDB University',
  '2023',
  'https://university.mongodb.com/certification/example',
  7
);

