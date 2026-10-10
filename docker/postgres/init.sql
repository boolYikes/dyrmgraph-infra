GRANT ALL PRIVILEGES ON DATABASE dg_run_meta_db TO dg_run_meta_user;
\connect dg_run_meta_db
GRANT ALL ON SCHEMA public TO dg_run_meta_user;

CREATE TABLE IF NOT EXISTS transform_runs (
    id BIGSERIAL PRIMARY KEY,
    queued_by TEXT,
    run_id TEXT,
    object_path TEXT,
    status TEXT,
    file_datetime TIMESTAMP,
    log TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_transform_runs_status_file_datetime
ON transform_runs(status, file_datetime);

CREATE TABLE IF NOT EXISTS compaction_runs (
    id BIGSERIAL PRIMARY KEY,
    run_id TEXT,
    target_date DATE,
    target_table TEXT,
    status TEXT,
    version INTEGER DEFAULT 0,
    log TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_compaction_runs_status_target_date
ON compaction_runs(status, target_date);