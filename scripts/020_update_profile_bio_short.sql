-- Update profile bio to be shorter and more impactful for hero section
UPDATE profiles 
SET bio = 'Bridging research, AI in healthcare, and community mental health programs. Over a decade of experience strengthening systems and representing Bangladesh in global health discussions with ethical leadership.'
WHERE full_name = 'Lamia Tasnim';

-- Verify the update
SELECT full_name, bio FROM profiles WHERE full_name = 'Lamia Tasnim';
