GRANT ALL PRIVILEGES ON DATABASE dg_run_meta_db TO dg_run_meta_user;
\connect dg_run_meta_db
GRANT ALL ON SCHEMA public TO dg_run_meta_user;

CREATE TABLE IF NOT EXISTS transform_runs (
    id BIGSERIAL PRIMARY KEY,
    queued_by TEXT,
    run_id TEXT,
    object_path TEXT,
    version INTEGER DEFAULT 0,
    status TEXT,
    partition_date DATE,
    log TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ
);

CREATE INDEX IF NOT EXISTS idx_transform_runs_status_partition_date
ON transform_runs(status, partition_date);