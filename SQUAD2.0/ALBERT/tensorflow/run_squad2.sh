export CUDA_VISIBLE_DEVICES=1,2,3
export SQUAD_DIR=~/QA-SOTA/datasets/SQUAD2.0
export ALBERT_MODEL_DIR=~/QA-SOTA/pretrained_models/ALBERT/albert_base
export OUTPUT_DIR=~/QA-SOTA/run_outputs/SQUAD2.0/albert/tensorflow
python run_squad_v2.py \
  --albert_config_file=$ALBERT_MODEL_DIR/albert_config.json \
  --vocab_file=$ALBERT_MODEL_DIR/30k-clean.vocab \
  --output_dir=$OUTPUT_DIR/ \
  --train_file=$SQUAD_DIR/train-v2.0.json \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_feature_file=$OUTPUT_DIR/train_feature.tfrecord \
  --predict_feature_file=$OUTPUT_DIR/predict_feature.tfrecord \
  --predict_feature_left_file=$OUTPUT_DIR/predict_feature_left.tfrecord \
  --init_checkpoint=$ALBERT_MODEL_DIR/model.ckpt-best \
  --spm_model_file=$ALBERT_MODEL_DIR/30k-clean.model \
  --do_lower_case \
  --max_seq_length=384 \
  --doc_stride=128 \
  --max_query_length=64 \
  --do_train \
  --do_predict \
  --train_batch_size=48 \
  --predict_batch_size=8 \
  --learning_rate=5e-5 \
  --num_train_epochs=2.0 \
  --warmup_proportion=.1 \
  --save_checkpoints_steps=5000 \
  --n_best_size=20 \
  --max_answer_length=30