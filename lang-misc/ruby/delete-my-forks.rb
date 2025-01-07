#!/usr/bin/env ruby

require 'octokit'

# Replace with your GitHub personal access token
GITHUB_TOKEN = ENV.fetch("GH_DEL_REPO_TOKEN")

# Replace with the organization or username to target
TARGET_OWNER = 'klara'

def fetch_all_repositories(client, owner)
  # Fetch all repositories for the given owner (user or org), handling pagination
  puts "Fetching all repositories for owner: #{owner}..."
  repos = []
  page = 1

  loop do
    response = client.repositories(owner, page: page, per_page: 100)
    repos.concat(response)
    break if response.empty? # Stop if there are no more results
    page += 1
  end

  repos
end

def fetch_forked_repositories(client, owner)
  # Get all repositories for the owner and filter for forks
  all_repos = fetch_all_repositories(client, owner)
  forks = all_repos.select(&:fork)
  puts "Found #{forks.size} forked repositories for owner: #{owner}."
  forks
end

def delete_repository(client, repo)
  # Delete the repository
  puts "Deleting #{repo.full_name}..."
  client.delete_repository(repo.full_name)
  puts "Deleted: #{repo.full_name}"
rescue Octokit::NotFound
  puts "Failed to delete: #{repo.full_name} (not found or insufficient permissions)"
end

def main
  if GITHUB_TOKEN.empty? || TARGET_OWNER.empty?
    puts 'Error: Please set your GitHub personal access token and target owner in the script.'
    exit 1
  end

  client = Octokit::Client.new(access_token: GITHUB_TOKEN)
  forks = fetch_forked_repositories(client, TARGET_OWNER)

  if forks.empty?
    puts 'No forked repositories found.'
    return
  end

  puts "Found #{forks.size} forked repositories for owner: #{TARGET_OWNER}:"
  forks.each { |repo| puts "- #{repo.full_name}" }

  print 'Are you sure you want to delete all these forked repositories? (yes/no): '
  confirm = gets.strip.downcase
  return unless confirm == 'yes'

  forks.each { |repo| delete_repository(client, repo) }
  puts 'All forked repositories deleted.'
end

main if __FILE__ == $PROGRAM_NAME

