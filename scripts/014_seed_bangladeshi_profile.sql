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

-- Insert profile data for Lamia Tasnim
-- NOTE: Profile image should be uploaded to Supabase Storage 'profile-images' bucket.
-- After uploading, update the profile_image URL using:
-- UPDATE profiles SET profile_image = 'your-storage-url' WHERE full_name = 'Lamia Tasnim';
INSERT INTO profiles (full_name, title, bio, email, phone, address, profile_image, linkedin_url, facebook_url, github_url)
VALUES (
  'Lamia Tasnim',
  'Public Health Professional | Researcher | Mental Health Systems Advocate (Bangladesh)',
  'Bangladeshi public health professional and mental health advocate with over a decade of experience. Her work connects research, AI in healthcare, and community programs—strengthening systems and representing Bangladesh in global mental health discussions, guided by ethics and sustainability.',
  'contact@lamia-tasnim.org',
  NULL,
  'Dhaka, Bangladesh',
  '/placeholder.svg?height=400&width=400',
  NULL,
  NULL,
  NULL
);

-- Insert education data
INSERT INTO education (institution, degree, field_of_study, start_date, end_date, cgpa, location, achievements, status, display_order)
VALUES 
(
  'North South University',
  'Master of Public Health (MPH)',
  'Public Health',
  'Not specified',
  'Not specified',
  'CGPA: 3.25',
  'Dhaka, Bangladesh',
  'Training and competencies include epidemiology, biostatistics (SPSS and Stata), research design, data analysis, and scientific reporting.',
  'Completed',
  1
),
(
  'Govt. College of Applied Human Science, University of Dhaka',
  'Bachelor of Science (BSc)',
  'Food & Nutrition',
  'Not specified',
  'Not specified',
  'CGPA: 3.38',
  'Dhaka, Bangladesh',
  'Academic foundation in nutrition, population health, and applied research; contributes to work across mental health, NCDs, and health equity.',
  'Completed',
  2
);

-- Insert professional experiences
INSERT INTO experiences (position, organization, project_name, start_date, end_date, location, employment_type, description, responsibilities, category, display_order)
VALUES
(
  'Leadership & Program Development (Mental Health Systems)',
  'Let’s Talk Mental Health (LTMH)',
  'National mental health awareness and institutional programming',
  '2018',
  'Present',
  'Bangladesh',
  'Volunteer / Leadership',
  'Progressed into leadership responsibilities contributing to structured national awareness campaigns and institutional mental health programming, with an emphasis on systems-building, ethics, and sustainability.',
  ARRAY[
    'Designed and supported structured mental health programming aligned with institutional needs, avoiding event-only outreach models',
    'Built capacity among youth volunteers through mentorship, governance practices, and ethical implementation standards',
    'Led initiatives with realistic reporting and transparent limitations to support long-term sustainability planning',
    'Coordinated multi-stakeholder engagement to strengthen community-level mental health systems'
  ],
  'Industry',
  1
),
(
  'Founder & Lead (Teacher Training for Psychosocial First Response)',
  'BrainWaves (Teacher Training Initiative)',
  'BrainWaves: psychosocial first responder training for educators',
  'Not specified',
  'Present',
  'Bangladesh (26 districts)',
  'Program Leadership',
  'Founded and developed BrainWaves to equip educators as psychosocial first responders and embed emotional literacy within educational institutions.',
  ARRAY[
    'Trained 400+ teachers across 26 districts, benefiting 40,000+ individuals directly and indirectly',
    'Developed training content and delivery models designed for institutional integration and scale',
    'Strengthened school-based psychosocial response capacity to improve early support and referral pathways',
    'Maintained ethical safeguards and culturally appropriate training approaches'
  ],
  'Industry',
  2
),
(
  'Public Health Researcher',
  'Academic & Applied Research (Public Health, Mental Health, and Digital Health)',
  'Epidemiology, health equity, and responsible AI in healthcare',
  'Not specified',
  'Present',
  'Bangladesh',
  'Research',
  'Contributed to academic and applied research spanning AI in healthcare, mental health, non-communicable diseases, maternal and child health, and health equity—emphasizing translation of findings into practical community-level systems.',
  ARRAY[
    'Applied epidemiology and biostatistics using SPSS and Stata to support rigorous research design and data analysis',
    'Conducted scientific reporting and research communication for academic and field audiences',
    'Supported implementation-oriented research that informs program design and systems strengthening',
    'Aligned research approaches with ethical standards and responsible use of AI in healthcare'
  ],
  'Research',
  3
),
(
  'Humanitarian & Crisis Response (Psychosocial Support)',
  'Community-based coordination during unrest',
  'Support for indigenous Marma families',
  'Not specified',
  'Not specified',
  'Bangladesh',
  'Humanitarian Support',
  'Contributed to coordinated humanitarian efforts integrating material assistance with psychosocial care, emphasizing dignity, consent, and culturally respectful engagement.',
  ARRAY[
    'Coordinated humanitarian support with safeguards for dignity, consent, and cultural respect',
    'Integrated psychosocial care considerations into relief efforts under challenging conditions',
    'Communicated and collaborated across stakeholders with sensitivity to community dynamics',
    'Maintained an ethical, non-sensational approach grounded in responsible engagement'
  ],
  'Industry',
  4
);

-- Insert publications
INSERT INTO publications (title, authors, journal, publication_date, status, category, keywords, abstract, url, academic_pdf, citation_count, conference_title, conference_organizer, location, conference_images, conference_paper_pdf, conference_videos, display_order)
VALUES
(
  'A Hyper-Tuned Vision Transformer Model with Explainable AI for Eye Disease Detection and Classification from Retinal Images',
  'Lamia Tasnim',
  'International Conference on Technology, Business, and Justice towards Smart Bangladesh (ICTBJ-2023)',
  '2023',
  'Presented',
  'Conference Publication',
  ARRAY['Explainable AI', 'Vision Transformer', 'Medical Imaging', 'Eye Disease Detection', 'Responsible AI'],
  'This research demonstrates engagement with advanced deep learning architectures and Explainable AI (XAI) in medical diagnostics, highlighting interpretability and responsible AI integration in healthcare systems.',
  NULL,
  NULL,
  0,
  'International Conference on Technology, Business, and Justice towards Smart Bangladesh (ICTBJ-2023)',
  NULL,
  'Bangladesh',
  NULL,
  NULL,
  NULL,
  1
),
(
  'Federated Learning in Healthcare: Model Misconducts, Security Challenges, Applications, and Future Research Directions: A Systematic Review',
  'Lamia Tasnim',
  NULL,
  NULL,
  'Published',
  'Academic Publication',
  ARRAY['Federated Learning', 'Healthcare AI', 'Security', 'Privacy', 'Governance', 'Ethics'],
  'This systematic review critically examines privacy-preserving distributed learning systems, addressing governance challenges, cybersecurity risks, and ethical considerations in healthcare AI ecosystems.',
  NULL,
  NULL,
  0,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  2
);

-- Insert skills
INSERT INTO skills (name, category, proficiency, display_order)
VALUES
('Epidemiology', 'Technical', 'Advanced', 1),
('Biostatistics (SPSS)', 'Technical', 'Advanced', 2),
('Biostatistics (Stata)', 'Technical', 'Advanced', 3),
('Research Design', 'Technical', 'Advanced', 4),
('Data Analysis', 'Technical', 'Advanced', 5),
('Scientific Reporting', 'Technical', 'Advanced', 6),
('Program Monitoring & Evaluation', 'Technical', 'Advanced', 7),
('Health Equity', 'Technical', 'Advanced', 8),
('Mental Health Systems', 'Technical', 'Advanced', 9),
('Digital Health & AI in Healthcare', 'Technical', 'Intermediate', 10),
('Ethical Leadership', 'Interpersonal', 'Advanced', 11),
('Institutional Capacity-Building', 'Interpersonal', 'Advanced', 12),
('Training & Facilitation', 'Interpersonal', 'Advanced', 13),
('Advocacy & Public Communication', 'Interpersonal', 'Advanced', 14),
('Cross-Cultural Communication', 'Interpersonal', 'Advanced', 15),
('Bangla', 'Languages', 'Native', 16),
('English', 'Languages', 'Fluent', 17);
-- Note: Language names must match the languageFlags mapping in the code
-- Bengali -> 🇧🇩, English -> 🇬🇧

-- Insert awards
INSERT INTO awards (title, issuer, date, description, image, display_order)
VALUES
(
  'Global Youth Leadership Award',
  'Global Youth Leadership Award (Nepal)',
  'Nepal (Year not specified)',
  'International recognition for sustained contribution to mental health advocacy and youth leadership advancing community-based mental health initiatives.',
  NULL,
  1
);

-- Insert volunteering activities
INSERT INTO volunteering (role, organization, start_date, end_date, description, display_order)
VALUES
(
  'Mental Health Systems Advocacy & Youth Leadership',
  'Let’s Talk Mental Health (LTMH)',
  '2018',
  'Present',
  'Contributed to structured national awareness campaigns and institutional mental health programming with an emphasis on ethical leadership and sustainable systems.',
  1
),
(
  'Program Development: BrainWaves Teacher Training',
  'BrainWaves (Teacher Training Initiative)',
  'Not specified',
  'Present',
  'Developed a teacher-training initiative equipping educators as psychosocial first responders; trained 400+ teachers across 26 districts and benefited 40,000+ individuals directly and indirectly.',
  2
),
(
  'Community Campaign: IronWoman',
  'Community Health Campaign',
  'Not specified',
  'Not specified',
  'Linked nutrition and emotional wellbeing, addressing iron deficiency and cognitive resilience among adolescent girls through community-centered engagement.',
  3
),
(
  'Humanitarian Support with Psychosocial Care',
  'Community-based coordination for indigenous Marma families',
  'Not specified',
  'Not specified',
  'Supported coordinated humanitarian efforts integrating material assistance with psychosocial care, emphasizing dignity, consent, and culturally respectful engagement.',
  4
);

-- Insert scholarly activities
INSERT INTO scholarly_activities (title, type, organization, date, description, display_order)
VALUES
(
  'International Conference on Technology, Business, and Justice towards Smart Bangladesh (ICTBJ-2023)',
  'Conference Presentation',
  'ICTBJ',
  '2023',
  'Presented research on a hyper-tuned Vision Transformer model with Explainable AI for eye disease detection and classification from retinal images.',
  1
),
(
  'Systems-building in Community Mental Health Programming',
  'Workshop / Training',
  'Let’s Talk Mental Health (LTMH) / BrainWaves',
  'Not specified',
  'Capacity-building approach focused on embedding emotional literacy and psychosocial first response within educational institutions.',
  2
),
(
  'Humanitarian Response with Psychosocial Care',
  'Community Engagement',
  'Community-based coordination',
  'Not specified',
  'Coordinated support during unrest with attention to consent, dignity, and culturally respectful engagement.',
  3
);

-- Certifications intentionally left empty (add via Admin panel if needed).

