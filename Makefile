clean:
	find ./ -type f ! -name "*.*"   | grep -v ".git" | grep -v 'Makefile' | xargs rm -v
