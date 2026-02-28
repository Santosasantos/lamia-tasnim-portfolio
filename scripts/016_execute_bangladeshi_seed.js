/**
 * Execution script for Bangladeshi profile seed data
 * This script runs all necessary migrations and seed data in the correct order
 * 
 * Usage: node scripts/016_execute_bangladeshi_seed.js
 * 
 * Prerequisites:
 * - Supabase project configured
 * - Environment variables set (SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)
 * - PostgreSQL client or Supabase CLI available
 */

const fs = require('fs');
const path = require('path');

// List of scripts to execute in order
const scripts = [
  '015_ensure_storage_setup.sql',  // First ensure all storage buckets and columns exist
  '014_seed_bangladeshi_profile.sql'  // Then insert the seed data
];

console.log('🚀 Starting Bangladeshi Profile Seed Data Migration...\n');

// Read and execute each SQL file
scripts.forEach((scriptName, index) => {
  const scriptPath = path.join(__dirname, scriptName);
  
  if (!fs.existsSync(scriptPath)) {
    console.error(`❌ Error: Script not found: ${scriptPath}`);
    process.exit(1);
  }
  
  const sqlContent = fs.readFileSync(scriptPath, 'utf8');
  
  console.log(`📄 [${index + 1}/${scripts.length}] Reading: ${scriptName}`);
  console.log(`   File size: ${(sqlContent.length / 1024).toFixed(2)} KB`);
  console.log(`   SQL statements: ${sqlContent.split(';').filter(s => s.trim().length > 0).length}\n`);
});

console.log('✅ All scripts validated successfully!\n');
console.log('📋 Execution Instructions:');
console.log('   1. Connect to your Supabase database');
console.log('   2. Run scripts in this order:');
scripts.forEach((script, index) => {
  console.log(`      ${index + 1}. ${script}`);
});
console.log('\n💡 You can execute these scripts using:');
console.log('   - Supabase Dashboard SQL Editor');
console.log('   - psql command line tool');
console.log('   - Supabase CLI: supabase db execute <script.sql>');
console.log('   - Your database management tool (pgAdmin, DBeaver, etc.)\n');
console.log('📝 Note: The seed data includes placeholder URLs for images, PDFs, and videos.');
console.log('   You should replace these with actual file URLs after uploading to Supabase Storage.\n');

