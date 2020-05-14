export CUDA_VISIBLE_DEVICES=1,2,3
python run_squad2.py \
--model_type albert \
--model_name_or_path ../../pretrained_models/ALBERT/albert_base/ \
--tokenizer_name ../../pretrained_models/ALBERT/albert_base/30k-clean.vocab \
--data_dir ../../datasets/SQUAD2.0/ \
--do_train \
--do_eval \
--version_2_with_negative \
--train_file train-v2.0.json \
--predict_file dev-v2.0.json \
--learning_rate 3e-5 \
--num_train_epochs 2 \
--max_seq_length 384 \
--doc_stride 128 \
--output_dir ../../../run_outputs/SQUAD2.0/ \
--per_gpu_eval_batch_size=3   \
--per_gpu_train_batch_size=3   \