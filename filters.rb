# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.select { |person| person[:id] == id } [0]
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def github_warrior(candidate)
  candidate[:github_points] > 100
end

def lang(candidate)
  candidate[:languages].include?("Python" || "Ruby")
end

def applied(candidate)
  candidate[:date_applied] >= 15.days.ago
end

def legal?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)
  candidates.select { |c| 
  experienced?(c) &&
  github_warrior(c) &&
  lang(c) &&
  applied(c) &&
  legal?(c)
  }
end

def ordered_by_qualification(candidates)
  candidates.sort_by { |c| [-c[:years_of_experience], -c[:github_points]] }
end

# More methods will go below
