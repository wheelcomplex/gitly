// Copyright (c) 2020 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by a GPL license that can be found in the LICENSE file.
module main

import time

struct Visit {
	id int
	repo_id int
	url string
	referer string
	created_at int
}

fn (mut app App) add_visit() {
	visit := Visit{
		repo_id: app.repo.id
		url: app.vweb.req.url
		referer: app.vweb.req.referer()
		created_at: int(time.now().unix)
	}
	sql app.db {
		insert visit into Visit
	}
}
