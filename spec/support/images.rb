# Helper function to open product images (utility method from our seeds)
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end